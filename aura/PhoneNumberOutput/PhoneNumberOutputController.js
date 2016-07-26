({
    receive : function(component, event, helper) {
        var phoneNum = event.getParam("phone");
        component.find("phone").set("v.number", phoneNum);
    }
})