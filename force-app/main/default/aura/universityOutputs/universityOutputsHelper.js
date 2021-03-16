({
	doSaveHelperMethod: function(component, event){
        let universityObject = event.getSource().get('v.value'); //to get the individual line of university instance object
    	let action = component.get('c.saveToUniversityObject');
        action.setParams({'uniObj': universityObject});
        action.setCallback(this, function(res){
            let state = res.getState();
            if(state === "SUCCESS"){
                component.set("v.universityId", res.getReturnValue());
                alert(component.get("v.universityId") + ' saved to University__c. Refresh the page.' );
            }
        })
        $A.enqueueAction(action);
	},
})