public with sharing class CTLocationController {
    
    //Buscar a lista recente dos Registros de localização através da Query
    public static List<Location__c> getRecentStatus(){
        return [SELECT Id, Name, Address__c, Pincode__c, Red_Score__c, Status_Update_Date__c, Status__c 
                FROM Location__c 
                ORDER BY Status_Update_Date__c DESC LIMIT 100];
    }
    //Retornar a lista de procura de localização
    public static List<Location__c> searchLocations(String searchTerm){
        searchTerm = searchTerm + '%';
        return [SELECT Id, Name,  Status_Update_Date__c 
                FROM Location__c
                 WHERE Name LIKE 'searchTerm%' 
                    OR Address__c LIKE 'searchTerm%' 
                    OR Pincode__c LIKE 'searchTerm%' 
                ORDER BY Status_Update_Date__c DESC NULLS LAST];
     }
    
     //Buscar localização por Id
     public static Location__c getLocationById(String locationId){
         
        List<Location__c> locations =  [SELECT Id, Name, Address__c, Pincode__c, Red_Score__c, Status_Update_Date__c, Status__c 
         FROM Location__c 
         WHERE Id = :locationId];
            //Se a Localização não for igual a null ou se o tamanho da localização for maior que 0
         if(locations != null && locations.size() > 0){
             return locations [0];

         }
         return null;
     }
}
