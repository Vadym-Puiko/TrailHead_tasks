public class LeadProcessor implements Database.Batchable<SObject> {
    
   
    public Database.QueryLocator start(Database.BatchableContext bc){
        String query = 'Select id,LeadSource from Lead';
        return Database.getQueryLocator(query);
    }
    
    public void execute(Database.BatchableContext bc, List<Lead> scope){
        for(Lead l: scope){
            l.LeadSource = 'DreamForce';
        }
        update scope;
    }

    public void finish(Database.BatchableContext bc){
        Id job = bc.getJobId();
        System.debug(job);
    }

}