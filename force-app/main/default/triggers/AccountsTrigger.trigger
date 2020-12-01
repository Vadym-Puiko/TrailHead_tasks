trigger AccountsTrigger on Account (before insert, before update, before delete, after delete, after insert, after update, after undelete) {
	fflib_SObjectDomain.triggerHandler(Accounts.class);
}