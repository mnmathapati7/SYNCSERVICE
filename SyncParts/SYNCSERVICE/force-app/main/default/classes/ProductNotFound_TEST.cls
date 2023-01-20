@isTest
private class ProductNotFound_TEST{
   @TestSetup
    private static void setupData(){
        List<SQX_Part__c> partList = new List<SQX_Part__c>();
        for(integer i=1;i<=500;i++){
            partList.add(new SQX_Part__c(Name = 'test'+i, Part_Number__c = '000'+i, Active__c=true));
        }
        insert partList;
        
   }
   private static testMethod void execute_TEST(){
        Test.startTest();
       
        Id batchId = Database.executeBatch(new ProductNotFound(), 500);
        Test.stopTest();
       List<Product2> newList = new List<Product2>([Select Id,Name From Product2]);
       system.assertEquals(500, newList.size(), 'msg');
    }
    private static testMethod void execute_As_Standard_User_TEST(){
        User testUser = TestFactory.generateUser('Standard User');
        system.runAs(testUser){
        Test.startTest();
        Id batchId = Database.executeBatch(new ProductNotFound(), 500);
            System.debug(batchId);
        Test.stopTest();
       List<Product2> newList = new List<Product2>([Select Id,Name From Product2]);
       system.assertEquals(0, newList.size(), 'msg');
    }
    }
}
