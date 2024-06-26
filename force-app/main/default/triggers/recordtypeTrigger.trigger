trigger recordtypeTrigger on House__c (before insert,before update) {
id recordID;
    string recordname;
    for(House__c obj:trigger.new){
       recordID =obj.RecordTypeId;
        
    }
    list<recordtype> recordlist=new list<recordtype>();
    
    recordlist=[select name from recordtype where id =: recordID  ];
    system.debug('recordlist====>'+recordlist);
    
    for(recordtype rec:recordlist){
       recordname =rec.name;
    }
    
    system.debug('recordname====>'+recordname);
}