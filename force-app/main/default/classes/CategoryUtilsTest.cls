@IsTest
public inherited sharing class CategoryUtilsTest {
    
    @IsTest
    static void testCategoriesNewDate() {
        Datetime dt = Datetime.now();
        Category__c c = new Category__c();
        CategoryUtils.setCategoriesDate(new List<Category__c>{c}, dt);
        System.assertEquals(dt, c.Date__c);
    }
}
