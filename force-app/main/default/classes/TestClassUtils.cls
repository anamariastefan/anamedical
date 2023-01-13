global class TestClassUtils {

    public static User getUser(String profileName, String FirstName, String LastName, Boolean isInsert) {
        Profile p = [SELECT Id FROM Profile WHERE Name =: profileName];
        
        User newUser = new User(
            Alias = 'standt', 
            Email = 'standarduser@testorg.com', 
            EmailEncodingKey = 'UTF-8',
            FirstName = FirstName,
            LastName = LastName, 
            LanguageLocaleKey = 'en_US', 
            LocaleSidKey = 'en_US', 
            ProfileId = p.Id, 
            TimeZoneSidKey = 'America/Los_Angeles', 
            UserName = profileName.replaceAll('\\s+','') + FirstName.replaceAll('\\s+','') + LastName.replaceAll('\\s+','') + '@testorg.com');
        
        if(isInsert)
            insert newUser;
        
        return newUser;
    }
    
    public static List<Patient__c> getPatientRecordList(Integer size, Boolean isInsert)
    {
        List<Patient__c> patients = new List<Patient__c>();
        for(Integer i = 0; i < size; i++) {
            Patient__c p = new Patient__c();
            p.Name = 'Test Patient' + i;
            p.Sex__c = 'Female';
            p.Insured__c = 'Yes';
            p.Insurance_Type__c = 'Private';
            p.Weight__c = 50;
            p.Height__c = 150;   
                
            patients.add(p);
        }
        
        if(isInsert)
            insert patients;
        
        return patients;
    }
    
    public static List<Procedure__c> getProcedureRecordList(Integer size, String Name, Boolean isInsert)
    {
        List<Procedure__c> procedures = new List<Procedure__c>();
        for(Integer i = 0; i < size; i++) {
			Procedure__c p = new Procedure__c();
            p.Name = 'Test Procedure' + i;
            p.Procedure_Name__c = Name;
            p.Type__c = 'Medical Procedure';
            
            procedures.add(p);
        }
        
        if(isInsert)
            insert procedures;
        
        return procedures;
    }
    
    public static List<Patient_Procedure__c> getPatientProcedureRecordList(Integer size, String PatientID, String ProcedureID, Boolean isInsert)
    {
        List<Patient_Procedure__c> PatientProcedures = new List<Patient_Procedure__c>();
        for(Integer i = 0; i < size; i++) {
			Patient_Procedure__c pp = new Patient_Procedure__c();
            pp.Name = 'Test Pacient Procedure' + i;
            pp.Procedure__c = ProcedureID;
            pp.Patient__c = PatientID;
            
            PatientProcedures.add(pp);
        }
        
        if(isInsert)
            insert PatientProcedures;
        
        return PatientProcedures;
    }
}