public with sharing class XmlCreator {
	public static void createXml(){
		Map<String, Object> item1= new Map<String, Object>();
		Case someCase = new Case(
		  Subject = 'Test Case 1'
		);
		item1.put('myCase', someCase);
		Map<String, Object> item2= new Map<String, Object>();
		Case someCase2 = new Case(
		  Subject = 'Test Case 2'
		);
		item2.put('myCase', someCase2);
		
		List<Map<String, Object>> itemMap = new List<Map<String, Object>>();
		itemMap.add(item1);
		itemMap.add(item2);
		
		String xmlTemplate = 'A message for {!myCase.Subject}.'; 
		// The below will return 'A message for Test Case.'
		Template tem = new Template(xmlTemplate);
		System.debug(tem.evaluate(itemMap));
	}
}