set echo on

Rem The password verify function template is in file $ORACLE_HOME/rdbms/admin/utlpwdmg.sql
Rem
Rem Following code is a simplified one Gang Liu programmed based on the Oracle sample code
Rem
Rem utlpwdmg.sql
Rem
Rem Copyright (c) 2006, 2013, Oracle and/or its affiliates. 
Rem All rights reserved. 
Rem
Rem    NAME
Rem      utlpwdmg.sql - script for Default Password Resource Limits
Rem
Rem    DESCRIPTION
Rem      This is a script for enabling the password management features
Rem      by setting the default password resource limits.
Rem
Rem    NOTES
Rem      This file contains a function for minimum checking of password
Rem      complexity. This is more of a sample function that the customer
Rem      can use to develop the function for actual complexity checks that the 
Rem      customer wants to make on the new password.
Rem

CREATE OR REPLACE FUNCTION SYS.verify_password (username        VARCHAR2,
                                                password        VARCHAR2,
                                                old_password    VARCHAR2)
   RETURN BOOLEAN
IS
   m             INTEGER;
   differ        INTEGER;
   v_minlength   INTEGER := 10;                  /* minimum password length */

   FUNCTION string_have_chars (p_string       IN VARCHAR2,
                               p_char_array   IN VARCHAR2)
      RETURN BOOLEAN
   IS
      V_RETURN   BOOLEAN := FALSE;
   BEGIN
      FOR i IN 1 .. LENGTH (p_char_array)
      LOOP
         FOR j IN 1 .. LENGTH (p_string)
         LOOP
            IF SUBSTR (p_string, j, 1) = SUBSTR (p_char_array, i, 1)
            THEN
               V_RETURN := TRUE;
               RETURN V_RETURN;
            END IF;
         END LOOP;
      END LOOP;

      RETURN V_RETURN;
   END;
BEGIN
   -- Check for the minimum length of the password
   IF LENGTH (password) < v_minlength
   THEN
      raise_application_error (-20002,
                               'Password length less than ' || v_minlength);
   END IF;

   -- Check if the password contains at least one letter, one digit and one punctuation mark.
   m := LENGTH (password);

   IF    string_have_chars (password, '0123456789') = FALSE
      OR string_have_chars (password, 'abcdefghijklmnopqrstuvwxyz') = FALSE
      OR string_have_chars (password, 'ABCDEFGHIJKLMNOPQRSTUVWXYZ') = FALSE
      OR string_have_chars (password, '!"#$%&()``*+,-/:;<=>?_') = FALSE
   THEN
      raise_application_error (
         -20003,
         'Password should contain at least one digit, one lower character, one upper character and one punctuation');
   END IF;

   -- Check if the password differs from the previous password by at least
   -- 3 letters

   IF old_password IS NOT NULL
   THEN
      differ := LENGTH (old_password) - LENGTH (password);

      IF ABS (differ) < 3
      THEN
         IF LENGTH (password) < LENGTH (old_password)
         THEN
            m := LENGTH (password);
         ELSE
            m := LENGTH (old_password);
         END IF;

         differ := ABS (differ);

         FOR i IN 1 .. m
         LOOP
            IF SUBSTR (password, i, 1) != SUBSTR (old_password, i, 1)
            THEN
               differ := differ + 1;
            END IF;
         END LOOP;

         IF differ < 3
         THEN
            raise_application_error (-20004, 'Password should differ by at \
         least 3 characters');
         END IF;
      END IF;
   END IF;

   -- Everything is fine; return TRUE ;
   RETURN (TRUE);
END;
/

desc verify_password
