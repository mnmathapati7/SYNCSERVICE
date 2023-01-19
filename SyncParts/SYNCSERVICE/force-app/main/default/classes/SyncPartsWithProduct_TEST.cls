@isTest
public class SyncPartsWithProduct_TEST {
    @TestSetup
    private static void setupData(){
        List<Product2> prodList = new List<Product2>();
        for(integer i=1;i<=250;i++){
            prodList.add(new Product2(Name = 'test'+i, ProductCode = '000'+i,IsActive=true));
        }
        insert prodList;
        List<SQX_Part__c> partList = new List<SQX_Part__c>();
        for(integer i=1;i<=500;i++){
            partList.add(new SQX_Part__c(Name = 'test'+i, Part_Number__c = '000'+i, Active__c=true));
        }
        insert partList;
         
        
        
        
        
    }
    @isTest
    private static void synchPartsWithProduct1_TEST(){
        Test.startTest();
        SynchPartsWithProduct.synchWhileInserting();
        List<SQX_Part__c>newList = new List<SQX_Part__c>([Select Id,Name,Product__c From SQX_Part__c Where Product__c = null]);
        system.assertEquals(250,newList.size(), 'expexted data is not matching with actual');
        Test.stopTest();

       
        
    }
    @isTest
    private static void synchPartsWithProduct1_TEST1(){
        User u = TestFactory.generateUser('Standard User');
        System.runAs(u) {
	    Test.startTest();
        SynchPartsWithProduct.synchWhileInserting();
            
            Test.stopTest();       

    }
        List<SQX_Part__c>newList = new List<SQX_Part__c>();
            newList = [Select Id,Name,Product__c From SQX_Part__c];
            System.assertEquals(500, newList.size(), 'msg');
        
    }
}