@isTest
public class LeadProcessorTest {

    @isTest
    public static void batchTest(){
        
        // create lead
        List<lead> insertLdList = new List<lead>();
        lead tmplead = new lead();
        
        for(Integer i=0; i < 10; i++){
            tmplead.Company = 'test '+i;
            tmplead.LastName = 'test '+i;
            insertLdList .add(tmplead);
            tmplead = new lead();
        }
        Insert insertLdList;
        
        Test.startTest();
        LeadProcessor ba = new LeadProcessor();
        Id batchId = Database.executeBatch(ba);
        Test.stopTest();
    
    }

}