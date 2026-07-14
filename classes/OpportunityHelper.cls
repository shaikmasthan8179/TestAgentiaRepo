public with sharing class OpportunityHelper {

    public static Decimal calculateDiscountedAmount(
        Decimal amount,
        Decimal discountPercentage
    ) {

        if(amount == null || discountPercentage == null){
            return 0;
        }

        Decimal discount = amount * (discountPercentage / 100);
        return amount - discount;
    }

    public static void updateOpportunityStage(List<Opportunity> oppList){

        for(Opportunity opp : oppList){
            if(opp.Amount >= 100000){
                opp.StageName = 'Negotiation/Review';
            }
        }

        update oppList;
    }
}