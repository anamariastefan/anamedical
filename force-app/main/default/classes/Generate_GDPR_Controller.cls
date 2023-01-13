public class Generate_GDPR_Controller {
    
    public Patient__c currentPatient {get; set;}
	public  String todayString {get; set;}
    
	/* Using the controller to get informations for the PDF form */
    public Generate_GDPR_Controller (ApexPages.StandardController controller) {
        /* Get Patient's info */
        String patientID = ApexPages.currentpage().getparameters().get('Id');
        currentPatient = [SELECT Name
                          FROM Patient__c
                          WHERE Id =: patientID];
        
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