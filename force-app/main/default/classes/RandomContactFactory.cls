public class RandomContactFactory {

    public static List<Contact> generateRandomContacts(integer countNum,string strParam){
        List<Contact> retList = new List<Contact>();
        Contact tmpObj = new Contact();
        
        for(Integer i=0;i<countNum;i++){
            tmpObj.FirstName = 'Test ' + i;
            tmpObj.LastName = strParam;
            retList.add(tmpObj);
            tmpObj = new Contact();
        }
        
        return retList;
    }
    
}