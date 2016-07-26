trigger ClosedOpportunityTrigger on Opportunity (after insert, after update) {
    List<Task> tasksToBeCreated = new List<Task>();
    for(Opportunity op: Trigger.new){
        if(op.stageName.equals('Closed Won')){
            tasksToBeCreated.add(new Task(subject='Follow Up Test Task', WhatId=op.id));
        }
    }
    insert tasksToBeCreated;
}