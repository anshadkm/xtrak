package com.nbad.xtrak.web;
import com.nbad.xtrak.domain.Expense;
import org.springframework.roo.addon.jsf.managedbean.RooJsfManagedBean;
import org.springframework.roo.addon.serializable.RooSerializable;

@RooSerializable
@RooJsfManagedBean(entity = Expense.class, beanName = "expenseBean")
public class ExpenseBean {
}
