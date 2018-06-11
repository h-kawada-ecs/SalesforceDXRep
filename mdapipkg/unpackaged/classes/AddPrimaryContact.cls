public class AddPrimaryContact implements Queueable {
    
    private Contact contactObj;
    private String StatementStr;
    
    public AddPrimaryContact(Contact record, String StateStr) {
        this.contactObj = record;
        this.StatementStr = StateStr;
    }
    
    public void execute(QueueableContext context) {
        List<Contact> InsertConList = new List<Contact>();
        Contact tmpConObj = new Contact();
        List<Account> updateAcc = [select Id from Account Where BillingState = :StatementStr Limit 200];
        for (Account acc : updateAcc) {
            tmpConObj = contactObj.clone(false, false, false, false);
            tmpConObj.AccountId = acc.Id;
            InsertConList.add(tmpConObj);
            tmpConObj = new Contact();
        }
        Insert InsertConList;
    }
    
}