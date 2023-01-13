@isTest
public class Generate_GDPR_Controller_Test {
    
    @isTest
    static void testingMethod() {
        Patient__c myPatient = TestClassUtils.getPatientRecordList(1, TRUE)[0];
        
        Test.startTest();
        	/* Testing the custom controller */
            PageReference defaultPage = new PageReference('/apex/Lightning_GDPR_Form');
            Test.setCurrentPage(defaultPage);
            defaultPage.getParameters().put('Id', myPatient.Id);
            ApexPages.StandardController sc = new ApexPages.StandardController(myPatient);
            Generate_GDPR_Controller controller = new Generate_GDPR_Controller(sc); 
        
        Test.stopTest();
    }
}