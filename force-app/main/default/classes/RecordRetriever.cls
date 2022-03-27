public inherited sharing class RecordRetriever {
    private static Map<String, List<SObject>> objectNameToValues = new Map<String,List<SObject>>();

    public static List<SObject> getRecords(String metadataApiName, List<SObject> records) {
        return objectNameToValues.containsKey(metadataApiName) ? objectNameToValues.get(metadataApiName) : records; 
    }

    public static void mockRecords(String metadataApiName, List<SObject> records) {
        objectNameToValues.put(metadataApiName, records);
    }
}
