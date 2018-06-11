@isTest
private class TestVerifyDate{

    @isTest static void CheckDates1() {
        Date firstDate = date.newinstance(2018, 1, 1);
        Date secondDate = date.newinstance(2018, 1, 2);
        VerifyDate.CheckDates(firstDate,secondDate);
    }
    
    @isTest static void CheckDates2() {
        Date firstDate = date.newinstance(2018, 1, 1);
        Date secondDate = date.newinstance(2019, 1, 1);
        VerifyDate.CheckDates(firstDate,secondDate);
    }
    
}