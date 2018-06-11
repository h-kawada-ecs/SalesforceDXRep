public with sharing class ContactAndLeadSearch {
    
    public static List<List<SObject>> searchContactsAndLeads(String parametar){
        List<List<SObject>> results = new List<List<SObject>>();
        results = [FIND :parametar IN ALL FIELDS RETURNING lead(FirstName,LastName), Contact(FirstName,LastName)];
        return results;
    }
    
}