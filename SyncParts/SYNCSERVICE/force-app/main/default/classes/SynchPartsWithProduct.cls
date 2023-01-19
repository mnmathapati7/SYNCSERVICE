public with sharing class SynchPartsWithProduct {
    public static void synchWhileInserting(){
        List<SQX_Part__c> newlst =new List<SQX_Part__c>([Select Id,Name,Product__c From SQX_Part__c Where Product__c = null]);
        List<Product2> productList = [SELECT Id,Name,ProductCode FROM Product2];
        for(SQX_Part__c part:newlst){
            for(Product2 prd:productList){
                if(part.Name == prd.Name){
                    part.Product__c = prd.Id;
                }
            }
		}
        update newlst;
     }
}