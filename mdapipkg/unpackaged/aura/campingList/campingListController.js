({
clickCreateItem : function(component, event, helper) {
var validCamping = component.find('campingform').reduce(function (validSoFar, inputCmp) {
// Displays error messages for invalid fields
inputCmp.showHelpMessageIfInvalid();
return validSoFar && inputCmp.get('v.validity').valid;
}, true);
 
if(validCamping){
var newCampingItem = component.get("v.newItem");
//helper.createCamping(component,newCampingItem);
var campings = component.get("v.items");
var item = JSON.parse(JSON.stringify(newCampingItem));
 
campings.push(item);
 
component.set("v.items",campings);
component.set("v.newItem",{ 'sobjectType': 'Camping_Item__c','Name': '','Quantity__c': 0,
'Price__c': 0,'Packed__c': false });
}
},
    
   doInit  : function(component, event, helper) {
		var action = component.get("c.getItems");
        action.setCallback(this, function(response){
            var state = response.getState();
           
            if (component.isValid() && state === "SUCCESS") {
           
               
                component.set("v.items", response.getReturnValue());
                 
            }
        });
        
        $A.enqueueAction(action);
	},
    
    createItem: function(component, newItem) {
    var action = component.get("c.saveItem");
    action.setParams({
        "item": newItem
    });
    action.setCallback(this, function(response){
        var state = response.getState();
        if (component.isValid() && state === "SUCCESS") {
            var items = component.get("v.items");
            items.push(response.getReturnValue());
            component.set("v.items", items);
        }
    });
    $A.enqueueAction(action);
},
    
    handleAdditem : function(component, event, helper){
        var addItm = event.getParam("item");
    	helper.createItem(component, addItm);
    }

})