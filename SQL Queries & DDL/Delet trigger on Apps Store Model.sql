


CREATE TRIGGER trg_deleteuseraccount

ON User_Account

AFTER DELETE AS

BEGIN

DECLARE @delete_user_id INT
SELECT  @delete_user_id = (SELECT User_Id FROM DELETED)

INSERT INTO LOGGER_DATA SELECT User_Id,	User_FirstName,	User_LastName,User_Gender,User_DateOfBirth,User_Address,
							   User_Country,	User_ZipCode,	User_Phone
						FROM Users WHERE User_Id = @delete_user_id
END



Delete From User_Account Where User_Id = 2006;

Select * From LOGGER_DATA

