public with sharing class AccountHelper {

    public static String getAccountName(Id accountId) {
        Account acc = [
            SELECT Id, Name
            FROM Account
            WHERE Id = :accountId
            LIMIT 1
        ];

        return acc.Name;
    }

    public static Integer getAnnualRevenueCategory(Decimal revenue) {
        if (revenue >= 1000000) {
            return 1; // Enterprise
        } else if (revenue >= 100000) {
            return 2; // Mid-Market
        }
        return 3; // Small Business
    }
}