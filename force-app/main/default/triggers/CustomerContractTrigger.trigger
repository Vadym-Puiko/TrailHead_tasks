trigger CustomerContractTrigger on Contract (before insert, before update) {
    
    List<User> listUsers = new List<User>();
    for(Contract cont : Trigger.New) {
        User user = new User();
        if(cont.IsCustomer__c && Trigger.IsInsert) {
    		user.LastName = 'NewUser';
    		user.Alias = user.LastName;
    		user.Email = 'newuser@gmail.com';
    		user.Username = user.Email;
    		user.CommunityNickname = user.LastName;
            
            listUsers.add(user);
            // create user
    	}
        if(cont.IsCustomer__c && Trigger.IsUpdate) {
        	user = [SELECT ID FROM USER WHERE ID = :cont.OwnerId];
            user.IsActive = true;
            update user;
            // activate
    	} 
        if(!cont.IsCustomer__c && Trigger.IsUpdate) {
            user = [SELECT ID FROM USER WHERE ID = :cont.OwnerId];
            user.IsActive = false;
            update user;
            // deactivate
        }
    }
    
    
    
    
    
    
    

}