({
	calculate : function(component, event, helper) {
		var inputOne = parseInt(component.find("inputOne").get("v.value"));
        var inputTwo = parseInt(component.find("inputTwo").get("v.value"));
        var inputThree = parseInt(component.find("inputThree").get("v.value"));
        component.find("totalValue").set("v.value", (inputOne +inputTwo)-inputThree);
        //component.set("v.totalValue",(inputOne +inputTwo)-inputThree);
       	}
})