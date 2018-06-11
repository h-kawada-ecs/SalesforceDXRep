public class ContactSearch {
    
    public static List<contact> searchForContacts(String LName,String pCode){
        List<contact> retList = new List<contact>();
        
        retList = [
            select Id,Name
            from contact
            Where LastName = :LName
            and MailingPostalCode = :pCode
             ];
        
        return retList;
        
    }


}