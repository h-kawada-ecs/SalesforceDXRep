@isTest
private class DailyLeadProcessorTest {

    public static String CRON_EXP = '0 0 0 15 3 ? 2022';

    static testmethod void testScheduledJob() {
        
        // create lead
        List<lead> insertLdList = new List<lead>();
        lead tmplead = new lead();
        
        for(Integer i=0; i < 200; i++){
            tmplead.Company = 'test '+i;
            tmplead.LastName = 'test '+i;
            insertLdList .add(tmplead);
            tmplead = new lead();
        }
        Insert insertLdList;
        
        Test.startTest();
        // Schedule the test job
        String jobId = System.schedule('ScheduledApexTest',
            CRON_EXP, 
            new DailyLeadProcessor());
        Test.stopTest();
        
    }
}