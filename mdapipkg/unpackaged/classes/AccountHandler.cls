public class AccountHandler {

    public static Account insertNewAccount(String inputname){
        Account insertAccList = new Account();
        insertAccList.Name = inputname;
        try{
            insert insertAccList;
            return insertAccList;
        }
        catch (DmlException e){
            return null;
        }
    
    }

}