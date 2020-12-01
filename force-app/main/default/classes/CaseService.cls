public with sharing class CaseService {
    
    public static void closeCases(Set<Id> caseIds, String closeReason) {
        if (caseIds == null || caseIds.size() == 0) {
            throw new CaseServiceException('You should tell me which cases you wanna close');
        }
        
        if (closeReason == null || closeReason == '') {
            throw new CaseServiceException('I won\'t close a case without any reason');
        }
        
        List<Case> casesToClose = [SELECT Id, Status, Reason FROM Case WHERE Id IN :caseIds];
        List<Case> closedCases = new List<Case>();
        
        for(Case caseToClose : casesToClose) {
            caseToClose.Status = 'Closed';
            caseToClose.Reason = closeReason;
            closedCases.add(caseToClose);
        }
        
        SavePoint sp = Database.setSavepoint();
        
        if(closedCases.size() > 0) {
            try {
                update closedCases;
            } catch (Exception e) {
                Database.rollback(sp);
                throw e;
            }
        }
    }
    
    public class CaseServiceException extends Exception {} 

}