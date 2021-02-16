@IsTest
public inherited sharing class SetDateToCategoryOnNewPositionTest {
    
    @IsTest
    static void testSetDateToCategoryOnNewPosition() {
        Datetime dt = Datetime.newInstance(2021, 01, 01);
        Category__c c = new Category__c(Name='Test', Vendor_code__c=1, Date__c=dt);
        insert c;
        Position__c p = new Position__c(Name='Test', Vendor_code__c=1, Category__c=c.id);
        Test.startTest();
        Database.SaveResult result = Database.insert(p);
        Test.stopTest();
        Category__c updatedC = [SELECT Date__c FROM Category__c WHERE Id=:c.id];
        System.assert(result.isSuccess());
        System.assertNotEquals(null, updatedC);
        System.assertNotEquals(c.Date__c, updatedC.Date__c);

    }
}
