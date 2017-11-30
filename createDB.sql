DECLARE @DBName varchar(50) = 'RENTAL'
WHILE EXISTS(select NULL from sys.databases where name = @DBName )
BEGIN
    DECLARE @SQL varchar(max)
    SELECT @SQL = COALESCE(@SQL,'') + 'Kill ' + Convert(varchar, SPId) + ';' FROM MASTER..SysProcesses WHERE DBId = DB_ID(@DBName) AND SPId <> @@SPId
    EXEC(@SQL)
    EXEC('DROP DATABASE ' + @DBName)
END
--GO
EXEC('CREATE DATABASE ' + @DBName)
GO
--CREATE DATABASE RENTAL; 