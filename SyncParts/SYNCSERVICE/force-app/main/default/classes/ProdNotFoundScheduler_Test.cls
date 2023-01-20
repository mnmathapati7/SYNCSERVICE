@isTest
public class ProdNotFoundScheduler_Test {
	
    public static testMethod void batchschedule() {
	Test.StartTest();
        ProdNotFoundSheduler Sch = new ProdNotFoundSheduler();
        string cron = '0 0 20 1/1 * ? *';
        Id batchId = system.schedule('Test Territory Check', cron, sch); 
        System.debug(batchId);
        Test.stopTest(); 
    }
    
    }
    
}