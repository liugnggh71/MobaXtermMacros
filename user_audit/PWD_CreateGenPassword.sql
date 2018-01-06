desc DBSNMP.GenPassword

CREATE OR REPLACE FUNCTION DBSNMP.GenPassword (
  i_chars_chr PLS_INTEGER DEFAULT 5,
  i_chars_num PLS_INTEGER DEFAULT 2,
  i_chars_spc PLS_INTEGER DEFAULT 1
) RETURN VARCHAR2
IS
  -- GenPassword - Generate a reasonable secure password
  --
  -- Parameter:
  -- i_chars_chr : number of alpha characters in the password
  -- i_chars_num : number of numeric characters in the password
  -- i_chars_spc : number of special characters in the password
  --
  -- Valid ranges are between 0 and 20 for every input parameter.
  -- Characters that get easily mixed up ('1' and 'l' or 'I',
  -- '0' and 'O', ...) are left out.
  --
  -- Example usage:
  -- SQL> select genpassword() from dual;
  --
  -- GENPASSWORD()
  -- ------------------------------------
  -- MXbjA6%4
  --
  l_chr VARCHAR2(60) := 'abcdefhijkmnoprstuvwxyzABCDEFGHIJKLMNPQRSTUVWXYZ';
  l_num VARCHAR2(60) := '0123456789';
  l_spc VARCHAR2(60) := '!#$%()*+,-:;<=>?_';
  --
  l_pwd VARCHAR2(60) := '';
  l_sel VARCHAR2(60) := '';
BEGIN
  --
  -- Raise an error if the input is out of sensible bounds
  --
  IF (i_chars_chr NOT BETWEEN 0 AND 20) OR
     (i_chars_num NOT BETWEEN 0 AND 20) OR
     (i_chars_spc NOT BETWEEN 0 AND 20) THEN
    RAISE value_error;
  END IF;
  --
  l_sel := l_sel||rpad('a', i_chars_chr, 'a');
  l_sel := l_sel||rpad('n', i_chars_num, 'n');
  l_sel := l_sel||rpad('s', i_chars_spc, 's');
  --
  -- Loop over selector in random order and build the password by
  -- choosing a random character from the class denoted by the
  -- selector.
  --
  FOR rec IN (SELECT level
                FROM dual
             CONNECT BY level <= length(l_sel)
               ORDER BY DBMS_RANDOM.value())
  LOOP
    CASE substr(l_sel, rec.level, 1)
      WHEN 'a' THEN
        l_pwd := l_pwd||substr(l_chr, DBMS_RANDOM.value(1, length(l_chr)), 1);
      WHEN 'n' THEN
        l_pwd := l_pwd||substr(l_num, DBMS_RANDOM.value(1, length(l_num)), 1);
      WHEN 's' THEN
        l_pwd := l_pwd||substr(l_spc, DBMS_RANDOM.value(1, length(l_spc)), 1);
      ELSE
        NULL;
    END CASE;
  END LOOP;
  --
  RETURN l_pwd;
END GenPassword;
/
