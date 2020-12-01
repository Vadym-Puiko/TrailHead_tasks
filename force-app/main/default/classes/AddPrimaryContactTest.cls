@isTest
public class AddPrimaryContactTest {
    
    @testSetup 
    static void setup() {
        List<Account> accounts = new List<Account>();
        
        for (Integer i = 0; i < 50; i++) {
        	accounts.add(new Account(Name='NY'+i, billingstate='NY'));
        }
         
        for (Integer j = 0; j < 50; j++) {
        	accounts.add(new Account(Name='CA'+j, billingstate='CA'));
        }
        insert accounts;
    }
    
    static testmethod void testQueueable(){
        Contact a = new Contact(Lastname='mary', Firstname='rose'); 
        Test.startTest();        
        AddPrimaryContact updater = new AddPrimaryContact(a, 'CA');
        System.enqueueJob(updater);
        Test.stopTest(); 
        
        System.assertEquals(50, [SELECT count() FROM Contact WHERE Lastname='mary' AND Firstname='rose']) ;                      
    }   
}