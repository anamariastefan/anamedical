public class Generate_Consent_Controller {
    
    public Patient_Procedure__c currentProcedure {get; set;}
    public List<Contact_Person__c> primaryContact {get; set;}
	public  String todayString {get; set;}
    
	/* Using the controller to get informations for the PDF form */
    public Generate_Consent_Controller (ApexPages.StandardController controller) {
        /* Get Patient's info */
        String procedureID = ApexPages.currentpage().getparameters().get('Id');
        currentProcedure = [SELECT Name, Patient__c, Patient__r.Name, Patient__r.ID_Series__c,
                            	   Procedure__c, Procedure__r.Procedure_Name__c,
                            	   Patient__r.Location__c, Patient__r.Location__r.VisitorAddressId, Patient__r.Location__r.VisitorAddress.Street, Patient__r.Location__r.VisitorAddress.City, Patient__r.Location__r.VisitorAddress.State
                            FROM Patient_Procedure__c
                            WHERE Id =: procedureID];
        
        primaryContact = [SELECT Id, Name
                          FROM Contact_Person__c
                          WHERE Contact_Person_Type__c = 'Primary' AND
                                Patient_Name__c =: currentProcedure.Patient__c];
            
            
        /* Create today string format dd.mm.yyyy */
        Date todayDate = system.today();
        String day;
        String month;
        if(todayDate.day() < 10) {
            day = '0' + String.valueOf(todayDate.day());
        }
        else
            day = String.valueOf(todayDate.day());
        if(todayDate.month() < 10) {
            month = '0' + String.valueOf(todayDate.month());
        }
        else
            month = String.valueOf(todayDate.month());
        
        todayString = day + '.' + month + '.' + String.valueOf(todayDate.year());
    }
}