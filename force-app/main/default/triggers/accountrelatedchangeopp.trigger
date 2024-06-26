trigger accountrelatedchangeopp on Account (after insert,after update) {
    if(trigger.isafter &&(trigger.isupdate || trigger.isinsert)){
        
        set<id> setofaccid=new set<id>();
        list<opportunity> opplist=new list<opportunity>();
        
        for(account acc:trigger.new){
            
            if(acc.BillingCity!=trigger.oldMap.get(acc.Id).BillingCity){
                
                setofaccid.add(acc.Id);
                
            }
            
        }
        
        opplist=[select id,city__c,account.BillingCity from opportunity where accountId IN :setofaccid];
        
        for(opportunity oppobj:opplist){
            
            oppobj.City__c=oppobj.account.BillingCity;
            
            
            
        }
        
update opplist;        
    }
}