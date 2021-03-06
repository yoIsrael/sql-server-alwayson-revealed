--Back Up Database and Log 

:Connect CLUSTERNODE1\PRIMARYREPLICA

BACKUP DATABASE Chapter5App2Customers TO  DISK = N'\\CLUSTERNODE1\AOAGShare\Chapter5App2Customers.bak' WITH  COPY_ONLY, FORMAT, INIT, REWIND, COMPRESSION,  STATS = 5 ;
GO

BACKUP LOG Chapter5App2Customers TO  DISK = N'\\CLUSTERNODE1\AOAGShare\Chapter5App2Customers.trn' WITH NOSKIP, REWIND, COMPRESSION,  STATS = 5 ;
GO

--Restore Database and Log 

:Connect CLUSTERNODE2\SYNCHA

RESTORE DATABASE Chapter5App2Customers FROM  DISK = N'\\CLUSTERNODE1\AOAGShare\Chapter5App2Customers.bak' WITH  NORECOVERY, STATS = 5 ;
GO

RESTORE LOG Chapter5App2Customers FROM  DISK = N'\\CLUSTERNODE1\AOAGShare\Chapter5App2Customers.trn' WITH  NORECOVERY,  STATS = 5 ;
GO
