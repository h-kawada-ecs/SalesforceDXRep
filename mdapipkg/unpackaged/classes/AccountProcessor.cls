public class AccountProcessor {

    @future
    public static void countContacts(List<Id> accIds){
        List<Account> accList = [select Id,(select Id from Contacts) from Account Where Id in :accIds];
        for(Account acc :accList){
            acc.Number_of_Contacts__c = acc.Contacts.size();
        }
        update accList;
    }

}