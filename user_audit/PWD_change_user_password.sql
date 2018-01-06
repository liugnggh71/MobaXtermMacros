alter user &username identified by "&passwd"; 

define username
define passwd

set long 4000
var NOTIFY_EMAIL clob;
DECLARE
    v_notify_email   VARCHAR2 (4000)
                := q'#Crystal,
New password for user &username. is changed to &passwd. please checkout.       

Thanks and Regards.

GAng Liu

The TNS connection stanza is:#';
BEGIN
    :NOTIFY_EMAIL :=  v_notify_email;
END;
/

print NOTIFY_EMAIL
