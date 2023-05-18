public with sharing class ReminderTaskGenerator {
    public ReminderTaskGenerator() {

    }

    public static void generateTimesheetSubmissionReminders(
                                    List<TImesheet__c> insertedTimesheets) {
        
        List<Task> reminders = new List<Task>();
        for(TImesheet__c t : insertedTimesheets) {
            Task submissionReminder = new Task();
            submissionReminder.Subject = 'Submit Your Timesheet!';
            submissionReminder.WhatId = t.Id;
            submissionReminder.ActivityDate = Date.today().addDays(7);

            reminders.add(submissionReminder);
        }

        try {
            insert reminders;
        } catch (Exception e) {
            
        }
         // Database.insert(reminders, false);
    }
}