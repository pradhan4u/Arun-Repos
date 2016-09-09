public with sharing abstract class TestClass {
	
	
public static integer StaticMember;
public integer NonStaticMember;
public static integer MyGoodStaticProp {
get{return MyGoodStaticProp;}
}
// The following produces a system error
public static integer MyBadStaticProp {get{return StaticMember;}  }
public integer MyGoodNonStaticProp {
get{return NonStaticMember;}
}

public TestClass(){
	StaticMember = 10;
	this.NonStaticMember=15;
}	

public virtual void write(){
	System.debug('Write in TestClass');
}

}