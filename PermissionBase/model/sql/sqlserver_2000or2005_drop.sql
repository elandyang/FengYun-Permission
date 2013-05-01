USE master
GO

/* É¾³ýÊý¾Ý¿â */
DROP DATABASE PermissionBase
GO

/* É¾³ýµÇÂ½Ãû */
EXEC sp_droplogin 'PB_DB_USER'
GO