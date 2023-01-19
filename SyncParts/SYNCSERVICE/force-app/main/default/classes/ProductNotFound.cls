public with sharing class ProductNotFound implements Database.Batchable<sObject> {
    public Database.QueryLocator start(Database.BatchableContext bc){
        String query ='Select Id,Name,Product__c,Part_Number__c From SQX_Part__c Where Product__c = null';
        return Database.getQueryLocator(query);
    }
    public void execute(Database.BatchableContext bc, List<SQX_Part__c> newlst){
      
        List<Product2> productList = [SELECT Id,Name,ProductCode FROM Product2];
        List<Product2> newProdList = new List<Product2>();
        integer syncStatus;
        //List<SQX_Part__c> productUnavalaibleList = new List<SQX_Part__c>();
        for(SQX_Part__c part:newlst){
            for(Product2 prd:productList){
                if(part.Name == prd.Name){
                    syncStatus=1;
                }                                           
            }
            if(syncStatus!=1){
                newProdList.add(new Product2(Name=part.Name,ProductCode=part.Part_Number__c,IsActive=true));
            }
        }
        
        insert newProdList;
        
    }
    
    public void finish(Database.BatchableContext bc){
        SynchPartsWithProduct.synchWhileInserting();
    }
    
}