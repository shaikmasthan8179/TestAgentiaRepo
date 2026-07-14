@isTest
private class AccountHelperTest {

    @testSetup
    static void createTestData() {
        Account acc = new Account(
            Name = 'Test Account',
            AnnualRevenue = 500000
        );
        insert acc;
    }

    @isTest
    static void testGetAccountName() {

        Account acc = [
            SELECT Id, Name
            FROM Account
            LIMIT 1
        ];

        Test.startTest();
        String accountName = AccountHelper.getAccountName(acc.Id);
        Test.stopTest();

        System.assertEquals(
            'Test Account',
            accountName,
            'Account name should match'
        );
    }

    @isTest
    static void testRevenueCategoryEnterprise() {

        Test.startTest();
        Integer category = AccountHelper.getAnnualRevenueCategory(2000000);
        Test.stopTest();

        System.assertEquals(1, category);
    }

    @isTest
    static void testRevenueCategoryMidMarket() {

        Test.startTest();
        Integer category = AccountHelper.getAnnualRevenueCategory(500000);
        Test.stopTest();

        System.assertEquals(2, category);
    }

    @isTest
    static void testRevenueCategorySmallBusiness() {

        Test.startTest();
        Integer category = AccountHelper.getAnnualRevenueCategory(50000);
        Test.stopTest();

        System.assertEquals(3, category);
    }
}