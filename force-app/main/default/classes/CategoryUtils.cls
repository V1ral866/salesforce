public inherited sharing class CategoryUtils {

    public static void setCategoriesDate(List<Category__c> categories, Datetime d) {
        for(Category__c c : categories) {
            c.Date__c = d;
        }
    }
}
