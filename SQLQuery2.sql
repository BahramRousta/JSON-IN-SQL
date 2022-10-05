DECLARE @cnt INT = (SELECT COUNT(name) + 1 FROM resulttbl);
DECLARE @JSONData NVARCHAR(MAX);
WHILE @cnt <= (SELECT COUNT([ID]) FROM Table_01)
BEGIN
	SET @JSONData =(SELECT [JSON]
	FROM [Table_01] where [ID] =@cnt)
			INSERT INTO resulttbl (name, year) 
			values (JSON_VALUE(@JSONData, '$.Info.schoolDetails.firstname[0].name'),
			JSON_VALUE(@JSONData, '$.Info.schoolDetails.firstname[1].year'))
	SET @cnt = @cnt + 1;
END;

select * from resulttbl