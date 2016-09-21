public with sharing class Fridge implements KitchenUtility {
	private String modelNumber;
	private integer numberInStock;
	public static Integer stockThreshold = 5;
	public integer ecoRating{
		get{return ecoRating;}
		set{ecoRating = value;if(ecoRating<0)ecoRating = 0;}
	}
	
	public Fridge() {
		modelNumber = 'XX-XX';
		numberInStock = 0;
	}
    



	public Fridge (String theModelNumber, Integer theNumberInStock) {
		modelNumber = theModelNumber;
		numberInStock = theNumberInStock;
	}
	
	public void updateStock(integer justSold)
	{
		numberInStock = numberInStock-justSold; 
	}
	
	public void setModelNumber(String theModelNumber)
	{
		modelNumber = theModelNumber;
	}
	
	public String getModelNumber()
	{
		return modelNumber;
	}


}