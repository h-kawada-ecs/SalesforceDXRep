trigger ClosedOpportunityTrigger on Opportunity (after insert,after update) {

    List<task> InsertTaskList = new List<task>();
    task tmpObj = new task();
    for(Opportunity opp : Trigger.new){
        if(opp.stageName == 'Closed Won'){
            tmpObj.Subject = 'Follow Up Test Task';
            tmpObj.WhatId = opp.Id;
            InsertTaskList.add(tmpObj);
            tmpObj = new task();
        }
    }
    if(InsertTaskList.size() > 0){
        Insert InsertTaskList;
    }
    
}