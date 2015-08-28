component norm_persistent="true" table="eventLog" extends="com.database.Norm" accessors="true" {
	property name="ID" type="numeric" fieldtype="id" generator="increment";
	property name="userID" type="string";

	property name="event" type="string";
	property name="description" type="string";
	property name="eventDate" type="date";
	/* Relationships */
	property name="user" inverseJoinColumn="ID" cascade="save-update" fieldType="one-to-one" fkcolumn="userID" cfc="model.User";

	function preLoad(){
		writeLog('preLoad');
	}
	function postLoad(){
		writeLog('postLoad');
	}
	function preInsert(){
		writeLog('preInsert');
	}
	function postInsert(){
		writeLog('postInsert');
	}
	function preUpdate( struct oldData ){
		writeLog('preUpdate: ' & serializeJSON( oldData.toStruct() ) );
	}
	function postUpdate(){
		writeLog('postUpdate');
	}
	function preDelete(){
		writeLog('preDelete');
	}
	function postDelete(){
		writeLog('postDelete');
	}

}