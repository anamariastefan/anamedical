global with sharing class GenericRemoter {

global GenericRemoter() {
}                             // empty constructor

//passing in the templateName parameter and making a check to run particular methods for apps
@RemoteAction
global static Map<String, Object> dataOk(String templateName){
    //    if(templateName == 'Sales_Analytics_Flex' || templateName == 'SalesAnalytics_SCE') {
      //          return SalesAppSpecific.forDataOk();
        //}
        //else if(templateName == 'Sales_Analytics_NonProfit') {
         //       return FundraisingAppSpecific.forDataOk();          
        //}
        //else if(templateName == 'FundraisingPerformance') {
          //      return FEA_Specific.forDataOk();
        //}
        //else if(templateName == 'LeadChangeAnalytics') {
          //      return LeadChangeSpecific.forDataOk();
        //}
        //else 
        if(templateName == 'HLSAnalyticsIndustryApp') {
               return HLS_Specific.forDataOk();
       }        
        else return orgCheckFailureMessage();
}

@RemoteAction
global static Map<String, Object> objectUsage(String templateName){
       // if(templateName == 'Sales_Analytics_Flex' || templateName == 'SalesAnalytics_SCE') {
          //      return SalesAppSpecific.forObjectUsage();
       // }
        //else if(templateName == 'Sales_Analytics_NonProfit') {
          //      return FundraisingAppSpecific.forObjectUsage();
        //}
        //else if(templateName == 'FundraisingPerformance') {
            //    return FEA_Specific.forObjectUsage();
       // }
        //else if(templateName == 'LeadChangeAnalytics') {
          //      return LeadChangeSpecific.forObjectUsage();
        //}
      //else 
      if(templateName == 'HLSAnalyticsIndustryApp') {
            return HLS_Specific.forObjectUsage();
      }        
        else return orgCheckFailureMessage();
}

@RemoteAction
global static Map<String, Object> fieldAccess(String templateName)
{
      // read it from a variable set in Modifier
      return new Map<String, Object>{
                     'success' => true,
                     'messagesVariable' => 'DefaultsVisibleMessages'
      };
}

@RemoteAction
global static Map<String, Object> configuration(String templateName){
        //if(templateName == 'Sales_Analytics_Flex' || templateName == 'SalesAnalytics_SCE') {
         //       return SalesAppSpecific.forConfiguration();
        //}
        //else if(templateName == 'Sales_Analytics_NonProfit') {
          //      return FundraisingAppSpecific.forConfiguration();
        //}
        //else if(templateName == 'FundraisingPerformance') {
         //       return FEA_Specific.forConfiguration();
       // }
        //else if(templateName == 'LeadChangeAnalytics') {
          //      return LeadChangeSpecific.forConfiguration();
        //}
        //else 
        if(templateName == 'HLSAnalyticsIndustryApp') {
                return HLS_Specific.forConfiguration();
        }        
        else return orgCheckFailureMessage();
}

@RemoteAction
global static Map<String, Object> dataInconsistencies(String templateName){
       // if(templateName == 'Sales_Analytics_Flex' || templateName == 'SalesAnalytics_SCE') {
         //       return SalesAppSpecific.forDataInconsistencies();
       // }
        //else if(templateName == 'Sales_Analytics_NonProfit') {
          //      return FundraisingAppSpecific.forDataInconsistencies();
        //}
        //else if(templateName == 'FundraisingPerformance') {
          //      return FEA_Specific.forDataInconsistencies();
        //}
        //else if(templateName == 'LeadChangeAnalytics') {
         //       return LeadChangeSpecific.forDataInconsistencies();
        //}
        //else 
        if(templateName == 'HLSAnalyticsIndustryApp') {
                return HLS_Specific.forDataInconsistencies();
        }        
        else return orgCheckFailureMessage();
}

private static Map<String, Object> orgCheckFailureMessage(){
    return new Map<String, Object>{
                   'success' => true,
                   'messages' => new List<String>{
                           'Something went wrong while running org checks.'
                   }
    };
  }
  /*
* Checks objects and records for the cards.
*/

@RemoteAction
global static Map<string, object> checkObjectWithRecords(String objectName, String query)
{
    return CardUtils.checkObjectWithRecords(objectName, query);                                           
}

}