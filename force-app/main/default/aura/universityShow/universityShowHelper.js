({
	searchUniFnhelperMethod : function(component, event) {
        
		let country = component.get("v.inputFieldSearchCountry");
        let action = component.get("c.getListOfUniversitiesInACountry");
        action.setParams({"place":country});
        action.setCallback(this, function(res){
			console.log(res.getState());
            console.log(res.getReturnValue()[0]);
            let state = res.getState();
            if(state === "SUCCESS"){
                component.set("v.resultValue", res.getReturnValue());
                
            }
        })
        $A.enqueueAction(action);
	},
    doSaveHelperMethod: function(component, event){
        //let universityObject = component.get("v.uniObj");
        let universityObject = event.getSource().get('v.value');
        //console.log('hi' + event.getSource().get('v.value').Name);
    	let action = component.get('c.saveToUniversityObject');
        action.setParams({'uniObj': universityObject});
        action.setCallback(this, function(res){
            let state = res.getState();
            if(state === "SUCCESS"){
                component.set("v.universityId", res.getReturnValue());
            }
        })
        $A.enqueueAction(action);
	},
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