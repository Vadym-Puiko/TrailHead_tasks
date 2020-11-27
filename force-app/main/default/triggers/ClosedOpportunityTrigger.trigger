trigger ClosedOpportunityTrigger on Opportunity (after insert, after update) {
    
    List<Task> lists = new List<Task>();
    for(Opportunity op : Trigger.New) {
        if(op.StageName == 'Closed Won') {
            lists.add(new Task(WhatId = op.Id, Subject='Follow Up Test Task'));
        } 
    }

    if((lists.size() > 0) && (lists.size() <= 200)) {
        insert lists;
    }

}