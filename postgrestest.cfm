<cfscript>
  dao = new com.database.dao( dsn = "dao", autoParameterize = true );
  userTest = new model.User( dao = dao );
</cfscript>

<cfdump var="#userTest.list()#" />