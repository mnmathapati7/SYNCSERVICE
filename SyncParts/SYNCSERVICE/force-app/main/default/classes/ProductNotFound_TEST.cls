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
   /* UserRole userRole = new UserRole(DeveloperName = 'TestingTeam', Name = 'Testing Team');
    insert userRole;
    User u = new User(
      LastName = 'last',
      Email = 'Cpt.Awesome@awesomesauce.com',
      Username = 'Cpt.Awesome@awesomesauce.com',
      CompanyName = 'Testing Co',
      Title = 'Captian',
      Alias = 'alias',
      TimeZoneSidKey = 'America/Los_Angeles',
      EmailEncodingKey = 'UTF-8',
      LanguageLocaleKey = 'en_US',
      LocaleSidKey = 'en_US',
      UserRoleId = userRole.Id
    );
    insert u;*/
        User testUser = TestFactory.generateUser('Standard User');
        system.runAs(testUser){
        Test.startTest();
        System.debug('Current User: ' + userInfo.getUserName());
        System.debug('Current User: ' + userInfo.getUserRoleId());
        Id batchId = Database.executeBatch(new ProductNotFound(), 500);
        Test.stopTest();
       List<Product2> newList = new List<Product2>([Select Id,Name From Product2]);
       system.assertEquals(500, newList.size(), 'msg');
    }
    }
}