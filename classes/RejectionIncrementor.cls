public with sharing class RejectionIncrementor {
    public RejectionIncrementor() {

    }

    public void incrementRejectionOnTimesheet(
                            List<TImesheet__c> updatedTimesheets,
                            Map<Id, TImesheet__c> oldValueMap) {

        // a0179000001BQFgAAO -> {Name: 'TS-0011', ...}
        
        for(TImesheet__c t : updatedTimesheets) {
            if(t.Status__c == 'Rejected' && 
                oldValueMap.get(t.Id).Status__c != 'Rejected') {

                if(t.Number_of_Times_Rejected__c == null) {
                    t.Number_of_Times_Rejected__c = 1;
                } else {
                    t.Number_of_Times_Rejected__c += 1;
                }

            }
        }

    }
    
}