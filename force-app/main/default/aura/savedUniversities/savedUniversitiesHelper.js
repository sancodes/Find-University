({
      showUniversitiesHelperMethod: function(component, event){
    	let action = component.get('c.retrieveUniversities');
        action.setCallback(this, function(res){
            let state = res.getState();
            if(state === "SUCCESS"){
                component.set("v.universityList", res.getReturnValue());
            }
        })
        $A.enqueueAction(action);
	},
})