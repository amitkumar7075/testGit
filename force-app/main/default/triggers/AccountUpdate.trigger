trigger AccountUpdate on Account (before insert,before update) {
    if(trigger.isBefore && trigger.isUpdate){
        list<Account> accountlist=new list<account>();
        for(account accountobject:trigger.new){
            
            if(accountobject.name!=trigger.oldMap.get(accountobject.id).name){
                accountobject.Description='Account Has Updated';
                accountlist.add(accountobject);
                    
                
              
            }
            
        }
        
    }

}