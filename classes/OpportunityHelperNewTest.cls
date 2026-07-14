@isTest
private class OpportunityHelperNewTest {
//Added by the Masthan//
    @testSetup
    static void createData() {

        Account acc = new Account(
            Name = 'Test Account'
        );
        insert acc;

        Opportunity opp = new Opportunity(
            Name = 'Test Opportunity',
            AccountId = acc.Id,
            CloseDate = System.today(),
            StageName = 'Prospecting',
            Amount = 150000
        );
        insert opp;
    }

    @isTest
    static void testCalculateDiscountedAmount() {

        Test.startTest();
        Decimal result =
            OpportunityHelperNew.calculateDiscountedAmount(
                10000,
                10
            );
        Test.stopTest();

        System.assertEquals(
            9000,
            result
        );
    }

    @isTest
    static void testCalculateDiscountedAmountNullValues() {

        Test.startTest();
        Decimal result =
            OpportunityHelpernew.calculateDiscountedAmount(
                null,
                null
            );
        Test.stopTest();

        System.assertEquals(
            0,
            result
        );
    }

    @isTest
    static void testUpdateOpportunityStage() {

        Opportunity opp = [
            SELECT Id, Amount, StageName
            FROM Opportunity
            LIMIT 1
        ];

        Test.startTest();
        OpportunityHelpernew.updateOpportunityStage(
            new List<Opportunity>{opp}
        );
        Test.stopTest();

        Opportunity updatedOpp = [
            SELECT StageName
            FROM Opportunity
            WHERE Id = :opp.Id
        ];

        System.assertEquals(
            'Negotiation/Review',
            updatedOpp.StageName
        );
    }
}