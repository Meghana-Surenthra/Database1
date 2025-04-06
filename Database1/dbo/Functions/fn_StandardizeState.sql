CREATE FUNCTION fn_StandardizeState
(
    @StateInput NVARCHAR(50)
)
RETURNS VARCHAR(50)
AS
BEGIN
    RETURN REPLACE(@StateInput, 'New york', 'NY')
END;