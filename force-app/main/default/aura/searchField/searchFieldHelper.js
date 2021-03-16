({
	searchUniFnhelperMethod : function(component, event) {
        
		let country = component.get("v.inputFieldSearchCountry");
        let action = component.get("c.getListOfUniversitiesInACountry");
        action.setParams({"place":country});
        action.setCallback(this, function(res){
            let state = res.getState();
            if(state === "SUCCESS"){
                component.set("v.resultValue", res.getReturnValue());
            }
        })
        $A.enqueueAction(action);
	},
})