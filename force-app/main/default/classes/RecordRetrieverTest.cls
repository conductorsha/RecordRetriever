@isTest
public class RecordRetrieverTest {
    @TestSetup
    static void makeData(){
        List<Account> accs = new List<Account>();
        for(Integer i = 0; i<100; i++) {
            accs.add(new Account(Name = String.valueOf(i)));
        }
        insert accs;
    }
    
    @IsTest
    static void getRealData(){
        System.assertEquals(100, RecordRetriever.getRecords('Account', [SELECT Id FROM Account]).size());
    }

    @IsTest
    static void getTestData(){
        Account acc = new Account(Name = 'TestData');
        RecordRetriever.mockRecords('Account', new List<SObject>{acc});

        List<Account> retrievedAccs =  RecordRetriever.getRecords('Account', [SELECT Id, Name FROM Account]);
        System.assertEquals(1, retrievedAccs.size());
        System.assertEquals('TestData', retrievedAccs.get(0).Name);
    }

    @IsTest
    static void testCombinations(){
        Account acc = new Account(Name = 'TestData');
        RecordRetriever.mockRecords('Account For Stub 1', new List<SObject>{acc});
        System.assertEquals(100, RecordRetriever.getRecords('Account', [SELECT Id FROM Account]).size());

        List<Account> retrievedAccs =  RecordRetriever.getRecords('Account For Stub 1', [SELECT Id, Name FROM Account]);
        System.assertEquals(1, retrievedAccs.size());
        System.assertEquals('TestData', retrievedAccs.get(0).Name);
    }
}
