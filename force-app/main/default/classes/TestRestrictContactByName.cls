@isTest
private class TestRestrictContactByName {
    
    @isTest
	static void TestRestrictContact() {
    	Contact con = new Contact(
            LastName = 'INVALIDNAME'
        );
        insert con;
    }

}