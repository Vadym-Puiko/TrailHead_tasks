@isTest
public class TestVerifyDate {
    
    @isTest static void testCheckDates() {
        Date myDate1 = Date.newInstance(1991, 2, 16);
        Date myDate2 = Date.newInstance(1991, 2, 28);
        Date pri = VerifyDate.CheckDates(myDate1, myDate2);
        System.assertEquals(myDate2, pri);
    }
    
    @isTest static void testCheckDatestheEnd() {
        Date myDate1 = Date.newInstance(1991, 3, 20);
        Date myDate2 = Date.newInstance(1990, 6, 10);
        Date pri = VerifyDate.CheckDates(myDate1, myDate2);
        System.assertEquals(Date.newInstance(1991, 3, 31), pri);
    }

}