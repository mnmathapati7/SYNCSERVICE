public with sharing class ProdNotFoundSheduler implements Schedulable{
   public void execute (SchedulableContext SC){
        ProductNotFound myBatch = new ProductNotFound();
 		Id batchJobId = Database.executeBatch(myBatch);
    }

}