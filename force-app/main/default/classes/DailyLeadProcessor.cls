global class DailyLeadProcessor implements Schedulable {
    
    global void execute(SchedulableContext ctx) {
        List<lead> leadsList = [
            SELECT Id, Name, LeadSource 
            FROM lead
            WHERE LeadSource = '' 
            Limit 200
        ];
        for(lead ld :leadsList){
            ld.LeadSource = 'Dreamforce';
        }
        update leadsList;
    }
    
}