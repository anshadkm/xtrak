// WARNING: DO NOT EDIT THIS FILE. THIS FILE IS MANAGED BY SPRING ROO.
// You may push code into the target .java compilation unit if you wish to edit any member(s).

package com.nbad.xtrak.web.converter;

import com.nbad.xtrak.domain.ExpenseDetails;
import com.nbad.xtrak.web.converter.ExpenseDetailsConverter;
import javax.faces.component.UIComponent;
import javax.faces.context.FacesContext;
import javax.faces.convert.FacesConverter;

privileged aspect ExpenseDetailsConverter_Roo_Converter {
    
    declare @type: ExpenseDetailsConverter: @FacesConverter("com.nbad.xtrak.web.converter.ExpenseDetailsConverter");
    
    public Object ExpenseDetailsConverter.getAsObject(FacesContext context, UIComponent component, String value) {
        if (value == null || value.length() == 0) {
            return null;
        }
        Long id = Long.parseLong(value);
        return ExpenseDetails.findExpenseDetails(id);
    }
    
    public String ExpenseDetailsConverter.getAsString(FacesContext context, UIComponent component, Object value) {
        return value instanceof ExpenseDetails ? ((ExpenseDetails) value).getId().toString() : "";
    }
    
}
