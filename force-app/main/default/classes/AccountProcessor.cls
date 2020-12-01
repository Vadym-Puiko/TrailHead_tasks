public class AccountProcessor {
    
    @future
    public static void countContacts(List<ID> accountIds) {
        
        List<Account> lstAccount = [select id, Number_of_Contacts__c , (select id from contacts ) from account where id in :accountIds ];
        for( Account acc : lstAccount ) {
            List<Contact> lstCont = acc.Contacts ;
            acc.Number_of_Contacts__c = lstCont.size();
        }
        update lstAccount;
    }

}