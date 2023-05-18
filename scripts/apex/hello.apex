// Use .apex files to store anonymous Apex.
// You can execute anonymous Apex in VS Code by selecting the
//     apex text and running the command:
//     SFDX: Execute Anonymous Apex with Currently Selected Text
// You can also execute the entire file by running the command:
//     SFDX: Execute Anonymous Apex with Editor Contents

String timesheetId = 'a0179000001BSLXAA4';

List<TImesheet__c> queriedTimesheets = [SELECT Hours__c, Name, Project__c, Status__c,
                                                Project__r.Name, 
                                                Project__r.Owner.Name,
                                                CreatedBy.Name
                                            FROM TImesheet__c
                                            WHERE Id = :timesheetId];

System.debug(queriedTimesheets);

for(TImesheet__c t : queriedTimesheets) {
    System.debug(t.Name + ' - ' + t.Project__r.Name + ' - ' + t.CreatedBy.Name);
}



List<Project__c> queriedProjects = [SELECT Id, Name, (SELECT Id, Name, Hours__c, CreatedBy.Name
                                                        FROM Timesheets__r)
                                            FROM Project__c];

System.debug(queriedProjects);

for(Project__c p : queriedProjects) {
    System.debug(p.Name);

    for(TImesheet__c t : p.Timesheets__r) {
        System.debug(t.Name + ' - ' + t.Hours__c + ' - ' + t.CreatedBy.Name);
    } 
}



[SELECT Id, Name, (SELECT Id, Status, Contact.Name
                    FROM CampaignMembers)
    FROM Campaign]


[SELECT Parent1__r.Field, Parent2__r.Field
    FROM Junction__c]


[SELECT Id, (SELECT Parent2__r.Field
            FROM Junctions__r)
    FROM Parent1__c]



List<Opportunity> opportunities = [SELECT Id, Name, AccountId, Account.Name, Account.BillingCity
                                    FROM Opportunity];
System.debug(opportunities);
for(Opportunity o : opportunities) {
    System.debug(o.Account.BillingCity);
}



List<Account> accounts = [SELECT Id, Name, (SELECT Id, Name
                                            FROM Opportunities)
                                    FROM Account];
System.debug(accounts);
for(Account a : accounts) {
    System.debug(a.Name);

    for(Opportunity o : a.Opportunities) {
        System.debug('--- ' + o.Name);
    }
}



String accountId = '0017900000L7cxCAAR';

Boolean value1 = false;
String queryString = '';
if(value1) {
    queryString += 'SELECT Id, Name ';
} else {
    queryString += 'SELECT BillingCity, CreatedById ';
}

queryString += 'FROM Account WHERE Id = :accountId';

System.debug(Database.query(queryString));