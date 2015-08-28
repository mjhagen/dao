component extends="taffy.core.resource" taffy_uri="breeze/todos/Todos" {

	remote function get(string $filter = "" ,string $orderby = "", string $skip = "", string $top = ""){

		//you could have an entity CFC modeling your table and invoke it such as:
  		//var todo = new model.TodoItem( dao = dao );
    	//or just invoke the Norm and point it at a table in the datasource (identified in dao)
		var todo = new com.database.Norm( dao = application.dao, table = "TodoItem");

		return representationOf(
        //returns a breeze object containing all of the matching entities in our DB
				todo.listAsoData(
						filter = arguments.$filter,
						orderby = arguments.$orderby,
						skip = arguments.$skip,
						top = arguments.$top,
                        excludeKeys = [ "_id", "other_field_you_want_to_hide" ]
					)
				).withStatus(200);

	}

  remote function post(){
    /**********************************************************************
    * Initialize Sample Table/Data
    * Normally you're data would be real, so you'd use a service for this.
    ***********************************************************************/

    // create instance of the TodoItem entity CFC.  This will create the table in the database
    // if it does not already exist
    todoItem = new model.TodoItem( dao = application.dao );
    // if there is any data present in the TodoItem table, delete it
    application.dao.delete("TodoItem","*");

    // now we'll add in our sample data
    todoItem.setDescription('Food');
    todoItem.setIsArchived(true);
    todoItem.setIsDone(true);
    todoItem.setCreatedAt( now() );
    todoItem.save();

    todoItem.copy();
    todoItem.setDescription('Water');
    todoItem.setIsArchived(true);
    todoItem.setIsDone(true);
    todoItem.save();

    todoItem.copy();
    todoItem.setDescription('Shelter');
    todoItem.setIsArchived(true);
    todoItem.setIsDone(true);
    todoItem.save();

    todoItem.copy();
    todoItem.setDescription('Bread');
    todoItem.setIsArchived(false);
    todoItem.setIsDone(false);
    todoItem.save();

    todoItem.copy();
    todoItem.setDescription('Cheese');
    todoItem.setIsArchived(false);
    todoItem.setIsDone(true);
    todoItem.save();

    todoItem.copy();
    todoItem.setDescription('Wine');
    todoItem.setIsArchived(false);
    todoItem.setIsDone(false);
    todoItem.save();

    return representationOf( todoItem.listAsoData( ) ).withStatus(200);
  }
}
