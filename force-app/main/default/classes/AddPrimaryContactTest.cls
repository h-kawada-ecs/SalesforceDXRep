@isTest
public class AddPrimaryContactTest {
    
    @testSetup 
    static void setup() {
        List<Account> accounts = new List<Account>();
        String FirstStateName = 'NY';
        String SecondStateName = 'CA';
        
        // add 100 accounts
        for (Integer i = 0; i < 50; i++) {
            accounts.add(new Account(
                name = 'Test Account'+FirstStateName+i,
                BillingState = FirstStateName
            ));
            accounts.add(new Account(
                name = 'Test Account'+SecondStateName+i,
                BillingState = SecondStateName
            ));
        }
        insert accounts;
    }
    
    static testmethod void testQueueable() {
        // query for test data to pass to queueable class
        Contact baseContact = new Contact(LastName = 'baseContact');
        String FirstStateName = 'NY';
        String SecondStateName = 'CA';
        // Create our Queueable instance
        AddPrimaryContact updater = new AddPrimaryContact(baseContact,SecondStateName);
        // startTest/stopTest block to force async processes to run
        Test.startTest();        
        System.enqueueJob(updater);
        Test.stopTest();
    }
    
}