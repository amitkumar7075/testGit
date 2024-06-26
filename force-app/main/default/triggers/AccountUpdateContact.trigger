/*
trigger AccountUpdateContact on Account (before insert,after update) {
    if(trigger.isAfter && trigger.isUpdate){
        
        list<account> accountlist=new list<account>();
        set<id> setofids=new set<id>();
        list<contact> contactlist=[select id,description from contact where id In: setofids];
        for(account accountobject:trigger.new){
            
            
            
            setofids.add(accountobject.Id);
            if(accountobject.name!=trigger.oldMap.get(accountobject.id).name){
                
                
                contact contactobject= new contact();
                
                contactobject.description='Contact description is change via Account changing';
                accountlist.add(accountobject);
                
            }
        }
        
     update contactlist;   
    }
} */


trigger AccountUpdateContact on Account (after update) {
    if (trigger.isAfter && trigger.isUpdate) {
        Set<Id> setOfIds = new Set<Id>();
        List<Contact> contactListToUpdate = new List<Contact>();
        
        // Collect the Account Ids that need to be updated
        for (Account accountObject : Trigger.new) {
            if (accountObject.Name != Trigger.oldMap.get(accountObject.Id).Name) {
                setOfIds.add(accountObject.Id);
            }
        }
        
        // Query the related Contacts and update their descriptions
        if (!setOfIds.isEmpty()) {
            contactListToUpdate = [SELECT Id, Description FROM Contact WHERE AccountId IN :setOfIds ];
            
            for (Contact contactObject : contactListToUpdate) {
                contactObject.Description = 'Contact description changed via Account update';
            }
            
            // Update the Contact records
            update contactListToUpdate;
        }
    }
}