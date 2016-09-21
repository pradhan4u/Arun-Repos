({
    sendPhone : function(component, event, helper) {
        var PhoneNumberEvent = component.getEvent("PhoneNumberEvent");
        var phone =  component.find("phone").get("v.phone");
        PhoneNumberEvent.setParams({phone : phone});
		PhoneNumberEvent.fire();

    }
})