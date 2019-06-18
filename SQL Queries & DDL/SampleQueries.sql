

/* Karambe_Akshat_Version2_SampleQueries */



/* Query to find out versionwise reviews given to each app */

SELECT Apps.App_Name, Review.Review_Description, Version.Version_Number 
FROM Apps
JOIN Version ON Apps.App_Id = Version.App_Id
JOIN Review ON Version.Version_Id = Review.Version_Id 


/* Query to find out applications stored in "Socials" Category */
SELECT  Apps.App_Id, Apps.App_Name, AppCategory.AppCategory_Name
FROM Apps 
JOIN AppCategory ON Apps.App_Id = AppCategory.App_Id
WHERE AppCategory_Name = 'Socials';


/* Query to find out which mobile devices are being used by females */
SELECT Users.User_FirstName,Users.User_Gender, Device.Device_Name
FROM Users JOIN Device ON Users.User_Id = Device.User_Id
WHERE Users.User_Gender = 'Female'


/* Query to find out which applications are downloaded by each user along with its date, time and version */
SELECT Users.User_FirstName , Apps.App_Name, Downloads.Downloads_Datetime, Version.Version_Number
FROM Users 
JOIN Downloads ON Users.User_Id = Downloads.User_Id
JOIN Apps ON Downloads.App_Id = Apps.App_Id  
JOIN Version ON Apps.App_Id = Version.App_Id



-- Stored Procedure--
Create Proc spVersionDown
As
Begin
    SELECT Users.User_FirstName , Apps.App_Name, Downloads.Downloads_Datetime, Version.Version_Number
    FROM Users 
    JOIN Downloads ON Users.User_Id = Downloads.User_Id
    JOIN Apps ON Downloads.App_Id = Apps.App_Id  
    JOIN Version ON Apps.App_Id = Version.App_Id

End
Exec spVersionDown
















select * from Version
select * from Apps











---Query To find the Total Numnber of Versions Per App having app size less than 20MB--
select App_Name, Count(Version_Number) AS Total_Versions, Apps.App_Size

from Apps

Join Version on Apps.App_Id = Version.App_Id

Group By  App_Name, Apps.App_Size

Having Apps.App_Size <= 20;