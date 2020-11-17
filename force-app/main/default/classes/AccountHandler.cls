public class AccountHandler {
    public static Account insertNewAccount(String name) {
        Account acct;
        try {
            acct = new Account(Name=name);
            insert acct;
        } catch(DmlException e) {
            System.debug(e.getMessage());
            return null;
        }
        return acct;
    }
    

}