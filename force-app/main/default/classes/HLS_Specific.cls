global with sharing class HLS_Specific {
  // empty constructor
  global HLS_Specific() {
  }

  global static Map<String, Object> forDataOk() {
    return AppsUtil.hasTasksEventsHistory();
  }

  global static Map<String, Object> forObjectUsage() {
    boolean leadFlag = false;
    List<string> displayMessages = new List<string>();
    String leadquery = 'SELECT count() from QueueSobject WHERE SobjectType = \'Lead\' limit 1';
    try {
      Integer countQueueRecords = database.countQuery(leadquery);
      if (countQueueRecords == 0) {
        leadFlag = false;
        displayMessages.add('No queues identified. Everything else looks good so far.');
      } else {
        leadFlag = true;
        displayMessages.add('Queues identified in this org. Everything else looks good so far.');
      }
    }
    catch (Exception e) {
    }
    System.debug('The display messages are');
    System.debug(displayMessages);

    if (leadFlag) {
      return new Map<String, Object>{
              'success' => true,
              'messages' => displayMessages
      };
    }

    return new Map<String, Object>{
            'success' => true,
            'messages' => displayMessages
    };
  }

  global static Map<string, object> forConfiguration() {
    List<Map<String, Object>> resultList = new List<Map<String, Object>>();
    resultList.add(AppsUtil.getOrgFiscalMonth());
    resultList.add(AppsUtil.getOrgFirstDayOfWeek());
    return AppsUtil.aggregateResults(resultList);
  }

  global static Map<string, object> forDataInconsistencies() {
    return new Map<String, Object>{
            'success' => true,
            'messagesVariable' => 'DefaultsVisibleMessages'
    };
  }
}