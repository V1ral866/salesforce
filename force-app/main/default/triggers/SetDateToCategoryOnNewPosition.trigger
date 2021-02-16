trigger SetDateToCategoryOnNewPosition on Position__c (after insert) {
	if (Trigger.isInsert) {
        System.debug('INSERT');
        CategoryIsActive c = new CategoryIsActive();
        List<String> ids = new List<String>();
        for (Position__c p : Trigger.NEW) {
            ids.add(p.Category__c);
        }
        List<Category__c> categories = [SELECT Active__c FROM Category__c WHERE id IN :ids];
        CategoryUtils.setCategoriesDate(categories, Datetime.now());
        update categories;
    } else {
        System.debug('ELSE');
    }
}