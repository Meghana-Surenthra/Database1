CREATE   FUNCTION dbo.fn_StandardizeVehicleMake
(
    @VehicleName VARCHAR(255),
    @VehicleMake VARCHAR(100),
    @VehicleModel VARCHAR(100)
)
RETURNS VARCHAR(100)
AS
BEGIN
    DECLARE @StandardizedMake VARCHAR(100)

    SET @StandardizedMake = 
        CASE 
            WHEN (@VehicleName NOT LIKE '%' + @VehicleMake + '%'
                  OR @VehicleName NOT LIKE '%' + @VehicleModel + '%'
                  OR @VehicleMake = '' 
                  OR @VehicleModel = '' 
                  OR @VehicleMake IS NULL 
                  OR @VehicleModel IS NULL)
            THEN LEFT(@VehicleName, CHARINDEX(' ', @VehicleName + ' ') - 1)
            ELSE @VehicleMake 
        END

    RETURN @StandardizedMake
END;