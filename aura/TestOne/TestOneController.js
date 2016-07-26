({
    handleClick : function(component, event) {
        var attributeValue = component.get("v.text");
        aura.log("current text: " + attributeValue);

        var target;
        if (event.getSource) {
            // handling a framework component event
            target = event.getSource(); // this is a Component object
            component.set("v.text", target.get("v.label"));
        } else {
            // handling a native browser event
            target = event.target.value; // this is a DOM element
            component.set("v.text", target);
        }
    }
})