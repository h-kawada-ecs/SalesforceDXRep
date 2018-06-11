global class LeadProcessor implements Database.Batchable<sObject>, Database.Stateful {
    
    global Database.QueryLocator start(Database.BatchableContext bc) {
        return Database.getQueryLocator(
            'SELECT ID, LeadSource FROM lead'
        );
    }
    
    global void execute(Database.BatchableContext bc, List<lead> scope){
        // process each batch of records
        List<lead> leadList = new List<lead>(scope);
        for (lead ld : leadList) {
            ld.LeadSource = 'Dreamforce';
        }
        update leadList;
    }
     
    global void finish(Database.BatchableContext bc){}

}