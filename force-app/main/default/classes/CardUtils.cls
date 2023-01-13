global with sharing class CardUtils {


    /*
     * Checks objects and records for the cards.
     * objectName : the name of object.
     * query: The SOQL query to check records for the object.
     */
    public static Map<string, object> checkObjectWithRecords(String objectName, String query)
    {
            Boolean isObject = false;
            try {
                isObject = CheckerUtils.hasListOfObjects(new String[] {objectName});
                
                if(!isObject){
                    return new Map<String, Object>{
                           'success' => true,
                           'object' => objectName,
                           'isObjectExist' => isObject,
                           'isRecordExist' => false,
                           'messages' => 'Object instance doesnot exist.'
                    };
                }
                
                List<Object> Records = database.query(query);
                Boolean isRecordExist = Records.isEmpty();
                
                String messageText = isRecordExist ? 'No records exists.' : 'Both Object instance and records exists for this object.';
                return new Map<String, Object>{
                           'success' => true,
                           'object' => objectName,
                           'isObjectExist' => isObject,
                           'isRecordExist' => !isRecordExist,
                           'messages' => messageText
                    };
            }
            catch(Exception e) {
                return new Map<String, Object>{
                           'success' => true,
                           'object' => objectName,
                           'isObjectExist' => isObject,
                           'isRecordExist' => false,
                           'messages' => 'No object instance and records exists for this object.'
                    };
            }                                                
    }

}