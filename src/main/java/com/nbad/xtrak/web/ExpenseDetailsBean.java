package com.nbad.xtrak.web;
import com.nbad.xtrak.domain.ExpenseDetails;
import org.springframework.roo.addon.jsf.managedbean.RooJsfManagedBean;
import org.springframework.roo.addon.serializable.RooSerializable;

@RooSerializable
@RooJsfManagedBean(entity = ExpenseDetails.class, beanName = "expenseDetailsBean")
public class ExpenseDetailsBean {
}
