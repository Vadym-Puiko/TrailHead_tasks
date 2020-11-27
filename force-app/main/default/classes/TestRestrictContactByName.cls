@isTest
private class TestRestrictContactByName {
    
    @isTest static void TestContactNameFail() {
        List<Contact> listCon= new List<Contact>();
        Contact con1 = new Contact(LastName='Sales');
        Contact con2 = new Contact(LastName='INVALIDNAME');
       
        listCon.add(con1);
        listCon.add(con2);
        
        Test.startTest();
            try {
                insert listCon;
            } catch(Exception ee) {
                System.debug(ee);
            }
        Test.stopTest(); 

    }

}