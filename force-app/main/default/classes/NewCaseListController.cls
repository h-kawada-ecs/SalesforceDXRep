public with sharing class NewCaseListController {
    
    public List<Case> newCases {get;set;}
    
    public NewCaseListController(){
        newCases = new List<Case>();
        getNewCases();
    }
    
    public List<Case> getNewCases(){
        newCases = [select Id,CaseNumber from case where status = 'New'];
        return newCases;
    }

}