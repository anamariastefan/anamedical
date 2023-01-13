public with sharing class ShowDocumentController {

    @AuraEnabled(cacheable=true)
    public static String getDocumentPublicURL(String documentId) {
        String DocumentPublicURL;
        system.debug('===>> documentId: ' + documentId);

        DocumentPublicURL = System.URL.getSalesforceBaseUrl().toExternalForm() + '/servlet/servlet.ImageServer?id=' + documentId + '&oid=' + UserInfo.getOrganizationId();
        
        system.debug('===>> DocumentPublicURL: ' + DocumentPublicURL);
           
        return DocumentPublicURL;
    }
}