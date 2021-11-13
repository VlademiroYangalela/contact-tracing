public with sharing class CTPersonController {
    
    //Metódo para criação de um token usando o MD5 Blob Hash
    public static String getToken(String mobileNo){
        Blob value = Blob.valueOf(mobileNo);
        Blob hash = Crypto.generateDigest('MD5', value);

        //get the String value of hash blob
        return EncodingUtil.base64Encode(hash);
    }

    //get 100 contacts with recent health status change by Query
   public static List<Person__c> getRecentHealthChanges(){
        return [SELECT Id, Name, Health_Status__c, Mobile__c, Status_Update_Date__c, Token__c 
                FROM Person__c 
                ORDER BY Status_Update_Date__c 
                DESC NULLS LAST LIMIT 100];
   }
   //Procurar pessoa por Nome, Tojen ou Mobile
   public static List<Person__c> searchPeople (String searchTerm){
       searchTerm = searchTerm +'%';
        return [SELECT Id, Name, Health_Status__c, Mobile__c, Status_Update_Date__c, Token__c 
                FROM Person__c 
                WHERE Name LIKE 'searchTerm%' 
                OR Mobile__c LIKE 'searchTerm%' 
                OR Token__c LIKE 'searchTerm%' 
                ORDER BY Status_Update_Date__c DESC NULLS LAST];
   }

   //Procurar pessoa por Id e @retorna person__c
   public static Person__c getPersonById(String personId){
        List<Person__c> people = [SELECT Id, Name, Health_Status__c, Mobile__c, Status_Update_Date__c, Token__c 
                                  FROM Person__c 
                                  WHERE Id =: personId];
            //Avalia se a variavel People não é igual a null ou Tamanho do people é maior que 0
            //Se for o caso retorna o primeiro elemento do Index da Lista.
         if(people != null && people.size() > 0){
            return people [0];

    }
        return null;
   }

}
