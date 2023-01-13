public with sharing class ShowMapController {
    
    @AuraEnabled(cacheable=true)
    public static addressWrapper getAddressInfo(Id recordId) {
        String sObjName = recordId.getSObjectType().getDescribe().getName();
        
        if(sObjName=='Patient__c') {
            Patient__c currentPatient= [SELECT Location__c, Location__r.VisitorAddressId,  Location__r.VisitorAddress.Name,
                                        	   Location__r.VisitorAddress.City, 
                                        	   Location__r.VisitorAddress.Country, 
                                  			   Location__r.VisitorAddress.PostalCode, 
                                  			   Location__r.VisitorAddress.State, 
                                  			   Location__r.VisitorAddress.Street
                                        FROM Patient__c 
                                        WHERE Id =: recordId];
            
            addressWrapper adresa = new addressWrapper( currentPatient.Location__r.VisitorAddressId,
                                       currentPatient.Location__r.VisitorAddress.Name,
                					   currentPatient.Location__r.VisitorAddress.City, 
                                  	   currentPatient.Location__r.VisitorAddress.Country, 
                                  	   currentPatient.Location__r.VisitorAddress.PostalCode, 
                                  	   currentPatient.Location__r.VisitorAddress.State, 
                                  	   currentPatient.Location__r.VisitorAddress.Street);
            return adresa;
        } else 
        	return NULL;
    }
    
    public class addressWrapper {
        @AuraEnabled
        public String Id;
        @AuraEnabled
        public String Name;
        @AuraEnabled
        public String City;
        @AuraEnabled
        public String Country;
        @AuraEnabled
        public String PostalCode;
        @AuraEnabled
        public String State;
        @AuraEnabled
        public String Street;
        
        public addressWrapper(String Id, String Name, String City, String Country, String PostalCode, String State, String Street){
            this.Id = Id;
            this.Name = Name;
            this.City = City;
            this.Country = Country;
            this.PostalCode = PostalCode;
            this.State = State;
            this.Street = Street;
        }
    }
}