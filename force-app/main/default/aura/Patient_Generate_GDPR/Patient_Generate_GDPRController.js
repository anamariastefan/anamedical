({
	doInit : function(component, event, helper) {
        component.set("v.showSpinner", true); 

        console.log("recordId: " + component.get("v.recordId"));
        window.open('/apex/Lightning_GDPR_Form?Id='+component.get("v.recordId"), '_blank');
        
        component.set("v.showSpinner", false);
        
        //Close the component after the GDPR is generated
        $A.get("e.force:closeQuickAction").fire();
        $A.get('e.force:refreshView').fire();
	}
})