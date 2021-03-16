public with Sharing class UniversityApi {
    
    //variable will hold the items to be transported in the UI
    public static List<University__c> listOfCountryUniversities = new List<University__c>();
    
    @AuraEnabled
    public static String consumeApi(String country){
        Http http = new Http();
    	HttpRequest req = new HttpRequest();
        req.setEndpoint('http://universities.hipolabs.com/search?country=' + country);
        req.setMethod('GET');
        HttpResponse res = http.send(req);
        
        if(res.getStatusCode()== 200){
            Object deserializedResponse = JSON.deserializeUntyped(res.getBody());
            List<Object> resObjList = (List<Object>) deserializedResponse;
            String uniName;
            for(Integer i = 0; i < resObjList.size(); i++){
                Map<String, Object> resMap = (Map<String, Object>) resObjList[i];
                List<Object> domain = (List<Object>) resMap.get('domains');
				List<Object> web_pages = (List<Object>) resMap.get('web_pages');
                /*
				* To render the items all together at UI: 
				* 	- decided to transport the items inside the List as an objects. 
                *      [{name: ..., country: ..., }, {name: ...., country: ....}]
				*/
                University__c  uni = new University__c(
                			Name=(String)resMap.get('name'), 
                            Country__c = (String)resMap.get('country'), 
                            Alpha_Two_Code__c = (String) resMap.get('alpha_two_code'),
                            Domains__c = (String) domain[0],
                            Web_Pages__c = (String) web_pages[0]
                );
                //instead of passing as a List<map<string,string>>, I'm passing as a instance of University__c object
                listOfCountryUniversities.add(uni); 
            }
        }
        
        return null;
    }

    //before passing in the input to the api call it will make sure that the input value is
    //space free and if has space, added with '+'
    @AuraEnabled
    public static List<University__c> getListOfUniversitiesInACountry(String place){
        consumeApi(removeSpaceAddPlus(place));
        return listOfCountryUniversities;
    }
    
    //since the api call adds '+' in between the space of a country name
    //renaming the country and passing it to consumingApi(...)
    //if no space then just this function could be like a check to see if the white space exists
    public static String removeSpaceAddPlus(String country){
        country=country.toLowerCase(); //converting to a lower case
        if(country.containsWhitespace())
        	country = country.replace(' ', '+');
        return country;
    }
    
    //inserting the input into the database
    @AuraEnabled
    public static String saveToUniversityObject(University__c uniObj){
        system.debug(uniObj);
        insert uniObj;
        return uniObj.Id;
    }
    
    //retrieving from the database
    @AuraEnabled
    public static List<University__c> retrieveUniversities(){
        return [SELECT ID, Name, Web_Pages__c, Country__c, Domains__c, Alpha_Two_Code__c FROM University__c ORDER BY CreatedDate DESC LIMIT 5];
    } 
}
