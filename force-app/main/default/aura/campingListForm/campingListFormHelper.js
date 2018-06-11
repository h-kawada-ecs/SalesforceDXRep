({
    createItemForm : function (component, newItemToSave)
    {
        console.log("entrou no create helper FORM");
        var action = component.getEvent("addItem");
        console.log("criada a action helper");
        console.log("erro no helper FORM");
        action.setParams({
            "item": newItemToSave
        });
        console.log("erro no helper2  FORM");
        action.fire();

    },
    validateCampingListForm: function(component) 
    {
        console.log("entrou na validacao FORM");
        var isCampingValid = true;
        var nameField = component.find("campingName");
        var quantityField = component.find("quantity");
        var priceField = component.find("price");

        if(nameField.get("v.value") == '' )
        {
            nameField.set("v.errors",[{message:"name can't be blank"}]);
            isCampingValid = false;
        }
        else
        {
            console.log("validou name field");
            nameField.set("v.errors",null);
        }

        if( quantityField.get("v.value") == '' )
        {
            quantityField.set("v.errors",[{message:"Quantity can't be blank"}]);
            isCampingValid = false;
        }
        else
        {
            console.log("validou quantity");
            quantityField.set("v.errors",null);
        }

        if(priceField.get("v.value") == '')
        {

            priceField.set("v.errors",[{message:"Price can't be blank"}]);
            isCampingValid = false;
        }
        else
        {
            console.log("validou price");
            priceField.set("v.errors",null); 
        }

        return(isCampingValid);
    },

createItem : function(component,item) {
    console.log("Inside the helper function");
    var addEvent = component.getEvent("addItem");
    addEvent.setParams({"item" : item});
    addEvent.fire();
    component.set("v.newItem",{'sObjectType':'Camping_Item__c',
                                       'Name': '',
                                       'Quantity__c': 0,
                                       'Price__c': 0,
                                       'Packed__c': false});
}
})