interface {

	any function init(
					required dao dao,
					required string dsn,
					string dbtype = "mysql",
					string user = "",
					string password = "",
					string transactionLogFile = "#expandPath('/')#sql_transaction_log.sql",
					boolean useCFQueryParams = true )
		description="I initialize DB Specific DAO Connector.";


	any function getLastID()
		description="I return the ID of the last inserted record.";

	boolean function delete( required string tableName, required string recordID, string IDField )
		description="I delete a record from the database where the PK matches the given recordID";

	boolean function deleteAll( required string tableName )
		description="I delete All records from the database.";

	query function select(
					string sql = "",
					string name = "sel_#listFirst(createUUID(),'-')#",
					any cachedWithin = "",
					string table = "",
					string columns = "",
					string where = "",
					any limit = "",
					any offset = "",
					string orderBy = ""
					)
		description="I select records from the database.";

	any function write( required tabledef tabledef )
		description="I insert data into the database.  I take a tabledef object containing the tablename and column values. I return the new record's Primary Key value.";

	any function update( required any tabledef, string columns = "", required string IDField )
		description="I update all fields in the passed table.  I take a tabledef object containing the tablename and column values. I return the record's Primary Key value.";

	query function define( required string tableName )
		description="I return the structure of the passed table.";

	query function getTables()
		description="I return a list of tables for the current database.";

	struct function getPrimaryKey( required string tableName )
		description="I return the primary key column name and type for the passed in table.";

	array function getPrimaryKeys( required string tableName )
		description="I return the primary keys column name and type for the passed in table.";

	string function  getSafeColumnNames( required string cols )
		description="I take a list of columns and return it as a safe columns list with each column wrapped within DB appropriate escape characters.";

	string function getSafeColumnName( required string col )
		description="I take a single column name and return it as a safe columns list with each column wrapped within DB appropriate escape characters.";

	string function getSafeIdentifierStartChar()
		description="I return the opening escape character for a column name.";


	string function getSafeIdentifierEndChar()
		description="I return the closing escape character for a column name.";

	tabledef function makeTable( required tabledef tabledef )
		description ="I create a table based on the passed in tabledef object's properties.";

	tabledef function dropTable( required string table )
		description="I drop a table based on the passed in table name.";

}