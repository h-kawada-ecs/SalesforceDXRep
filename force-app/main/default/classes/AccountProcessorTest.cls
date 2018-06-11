@isTest
public class AccountProcessorTest {

    @isTest
    public static void countContactsTest(){
        
        // create account and contact
        List<account> insertAccList = new List<account>();
        account tmpAcc = new account();
        List<contact> insertConList = new List<contact>();
        contact tmpCon = new contact();
        
        for(Integer i=0; i<2; i++){
            tmpAcc.name = 'test '+i;
            insertAccList.add(tmpAcc);
            tmpAcc = new account();
        }
        Insert insertAccList;
        
        List<Id> accIdList = new List<Id>();
        
        for(account acc :insertAccList){
            accIdList.add(acc.Id);
            tmpCon.AccountId = acc.Id;
            tmpCon.LastName = acc.Name + 'con 1';
            insertConList.add(tmpCon);
            tmpCon = new contact();
            tmpCon.AccountId = acc.Id;
            tmpCon.LastName = acc.Name + 'con 2';
            insertConList.add(tmpCon);
            tmpCon = new contact();
        }
        Insert insertConList;
        
        Test.startTest();
        AccountProcessor.countContacts(accIdList);
        Test.stopTest();
    
    }

}