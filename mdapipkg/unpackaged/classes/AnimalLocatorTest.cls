@isTest
private class AnimalLocatorTest {
    
    @isTest
    static void testGetCallout() {
        Test.setMock(HttpCalloutMock.class, new AnimalLocatorMock()); 
        AnimalLocator.getAnimalNameById(1);      
    }
    
    @isTest
    static void testGetCalloutFailed() {
        Test.setMock(HttpCalloutMock.class, new AnimalLocatorFailedMock()); 
        AnimalLocator.getAnimalNameById(1);      
    }
    
}