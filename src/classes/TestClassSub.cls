public with sharing class TestClassSub extends TestClass {
	public static integer StaticMember;
	
	public TestClassSub(){
	StaticMember = 15;
	this.NonStaticMember=10;
}	

public override void write(){
	System.debug('Write in TestClassSub');
	super.write();
}
	
}