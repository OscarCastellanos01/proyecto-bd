/****** Object:  User [administrator]    Script Date: 5/19/2024 3:26:19 PM ******/
CREATE USER [administrator] WITHOUT LOGIN WITH DEFAULT_SCHEMA=[AplicationComercial]
GO
/****** Object:  User [administrador]    Script Date: 5/19/2024 3:26:19 PM ******/
CREATE USER [administrador] WITHOUT LOGIN WITH DEFAULT_SCHEMA=[admivision]
GO
/****** Object:  DatabaseRole [db_execproc]    Script Date: 5/19/2024 3:26:19 PM ******/
CREATE ROLE [db_execproc]
GO
ALTER ROLE [db_execproc] ADD MEMBER [administrator]
GO
ALTER ROLE [db_owner] ADD MEMBER [administrator]
GO
ALTER ROLE [db_execproc] ADD MEMBER [administrador]
GO
ALTER ROLE [db_owner] ADD MEMBER [administrador]
GO
ALTER ROLE [db_ddladmin] ADD MEMBER [administrador]
GO
ALTER ROLE [db_datareader] ADD MEMBER [administrador]
GO
ALTER ROLE [db_datawriter] ADD MEMBER [administrador]
GO
/****** Object:  Schema [administrador]    Script Date: 5/19/2024 3:26:20 PM ******/
CREATE SCHEMA [administrador]
GO