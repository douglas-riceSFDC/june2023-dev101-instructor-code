trigger Timesheet on Timesheet__c (before update, after insert) {

    if(Trigger.isBefore && Trigger.isUpdate) {
        RejectionIncrementor incrementor = new RejectionIncrementor();
        incrementor.incrementRejectionOnTimesheet(Trigger.new, Trigger.oldMap);
    } else if(Trigger.isAfter && Trigger.isInsert) {
        ReminderTaskGenerator.generateTimesheetSubmissionReminders(Trigger.new); 
    }
}