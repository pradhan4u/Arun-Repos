@isTest
private class TestVerifyDate {
@isTest
    static void testDateWithin30Days(){
        Date date1 = Date.newInstance(2015, 6, 1);
        Date date2 = date1.addDays(29);
        Date retDate = VerifyDate.CheckDates(date1, date2);
        System.AssertEquals(retDate, date2);
    }
    @isTest
    static void testDateEquals30Days(){
        Date date1 = Date.newInstance(2015, 6, 1);
        Date date2 = date1.addDays(30);
        Date retDate = VerifyDate.CheckDates(date1, date2);
        Integer totalDays = Date.daysInMonth(date1.year(), date1.month());
        Date lastDay = Date.newInstance(date1.year(), date1.month(), totalDays);
        System.AssertEquals(retDate, lastDay);
    }
        @isTest
    static void testDateMoreThan30Days(){
        Date date1 = Date.newInstance(2015, 6, 1);
        Date date2 = date1.addDays(31);
        Date retDate = VerifyDate.CheckDates(date1, date2);
        Integer totalDays = Date.daysInMonth(date1.year(), date1.month());
        Date lastDay = Date.newInstance(date1.year(), date1.month(), totalDays);
        System.AssertEquals(retDate, lastDay);
    }
}