public with sharing class CTLocationTracingController {
    
    public static List<Location_Tracing__c> getVisitors(String locationId){
        return  [SELECT Id, Name, Person__c, Location__c, Visit_Date__c,Person__r.Token__c, Person__r.Health_Status__c 
                    FROM Location_Tracing__c 
                    WHERE Id =: locationId
                    ORDER BY Visit_Date__c DESC];
    }

    
}
