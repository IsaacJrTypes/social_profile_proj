-- Create procedure to check number of entries in table, return num
SELECT 'Hi' as msg;
SHOW DATABASES;
DELIMITER $$
DROP PROCEDURE IF EXISTS num_table_entries$$
CREATE DEFINER='root'@'localhost' PROCEDURE num_table_entries(IN table_name_ VARCHAR(100))
BEGIN
	SELECT 'from func' as msg;
	-- Set vars
	SET @table_n = table_name_;
    SET @cmd = CONCAT('SELECT COUNT(*) AS num_entries FROM ',@table_n);
    -- Load, execute, unload
    PREPARE cmd_func FROM @cmd;
    EXECUTE cmd_func;
    DEALLOCATE PREPARE cmd_func;
END$$
DELIMITER ;
SELECT 'end' as msg;
