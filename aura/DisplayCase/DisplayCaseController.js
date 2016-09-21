({
	getCaseDetails : function(component, event, helper) {
        $A.log("Entered................");
        console.log("Entered................");
        debugger;
		 var action = component.get("c.getCaseFromId");
      		action.setParams({ caseID : component.find("caseID").get("v.value")});
        action.setCallback(this, function(response) {
            var state = response.getState();
            // This callback doesn’t reference cmp. If it did,
            // you should run an isValid() check
            //if (cmp.isValid() && state === "SUCCESS") {
            if (state === "SUCCESS") {
                // Alert the user with the value returned 
                // from the server
                component.set("v.record", response.getReturnValue());


                // You would typically fire a event here to trigger 
                // client-side notification that the server-side 
                // action is complete
            }
            //else if (cmp.isValid() && state === "ERROR") {
            else if (state === "ERROR") {
                var errors = response.getError();
                if (errors) {
                    $A.logf("Errors", errors);
                    if (errors[0] && errors[0].message) {
                        $A.error("Error message: " + 
                                 errors[0].message);
                    }
                } else {
                    $A.error("Unknown error");
                }
            }
        });
        $A.enqueueAction(action);

	}
})