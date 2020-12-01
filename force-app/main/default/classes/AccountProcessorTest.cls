@isTest
public class AccountProcessorTest {
    
    public static testmethod void TestAccountProcessorTest(){
        Account a = new Account();
        a.Name = 'Test Account';
        insert a;

        Contact cont = New Contact();
        cont.FirstName ='Bob';
        cont.LastName ='Masters';
        cont.AccountId = a.Id;
        insert cont;
       
        List<ID> listAccId = new List<ID>();
        listAccId.add(a.id);
 
        Test.startTest();
            AccountProcessor.countContacts(listAccId);
        Test.stopTest();
       
        Account acc = [select Number_of_Contacts__c from Account where id = :a.id LIMIT 1];
        System.assertEquals(Integer.valueOf(acc.Number_of_Contacts__c) ,1);
  }

}