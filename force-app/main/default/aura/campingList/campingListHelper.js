({
	
    validateFields : function (component,field) {
        
        var nameField = field;
        console.log('yes:'+nameField);
        var expname = nameField.get("v.value"); 
        if ($A.util.isEmpty(expname)){
           component.set("v.er",true);
           nameField.set("v.errors", [{message:"this field can't be blank."}]);
        }
        else {
            nameField.set("v.errors", null);
        }
    },
    
    createItem : function (component,newItem){         
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
                component.set("v.newItem",{'sobjectType':'Camping_Item__c',
                                   'Name': '',
                                   'Quantity__c': 0,
                                   'Price__c': 0,
                                   'Packed__c': false});
            }
        });
        $A.enqueueAction(action);       
    },

})