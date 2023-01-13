@isTest
public class Generate_Consent_Controller_Test {

    @isTest
    static void testingMethod() {
        Patient__c myPatient = TestClassUtils.getPatientRecordList(1, TRUE)[0];
        Procedure__c myProcedure = TestClassUtils.getProcedureRecordList(1, 'Abdominoplastie', TRUE)[0];
        Patient_Procedure__c myPatientProcedure = TestClassUtils.getPatientProcedureRecordList(1, myPatient.Id, myProcedure.Id, TRUE)[0];
        
        Test.startTest();
        	/* Testing the custom controller */
            PageReference defaultPage = new PageReference('/apex/Lightning_Consent_Form');
            Test.setCurrentPage(defaultPage);
            defaultPage.getParameters().put('Id', myPatientProcedure.Id);
            ApexPages.StandardController sc = new ApexPages.StandardController(myPatientProcedure);
            Generate_Consent_Controller controller = new Generate_Consent_Controller(sc); 
        
        Test.stopTest();
    }
}