// WARNING: DO NOT EDIT THIS FILE. THIS FILE IS MANAGED BY SPRING ROO.
// You may push code into the target .java compilation unit if you wish to edit any member(s).

package com.nbad.xtrak.domain;

import com.nbad.xtrak.domain.Expense;
import com.nbad.xtrak.domain.ExpenseDataOnDemand;
import com.nbad.xtrak.domain.Login;
import com.nbad.xtrak.domain.LoginDataOnDemand;
import java.security.SecureRandom;
import java.util.ArrayList;
import java.util.Calendar;
import java.util.Date;
import java.util.GregorianCalendar;
import java.util.Iterator;
import java.util.List;
import java.util.Random;
import javax.validation.ConstraintViolation;
import javax.validation.ConstraintViolationException;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;

privileged aspect ExpenseDataOnDemand_Roo_DataOnDemand {
    
    declare @type: ExpenseDataOnDemand: @Component;
    
    private Random ExpenseDataOnDemand.rnd = new SecureRandom();
    
    private List<Expense> ExpenseDataOnDemand.data;
    
    @Autowired
    LoginDataOnDemand ExpenseDataOnDemand.loginDataOnDemand;
    
    public Expense ExpenseDataOnDemand.getNewTransientExpense(int index) {
        Expense obj = new Expense();
        setItemcode(obj, index);
        setPaidBy(obj, index);
        setRemarks(obj, index);
        setTotalCost(obj, index);
        setXpdate(obj, index);
        return obj;
    }
    
    public void ExpenseDataOnDemand.setItemcode(Expense obj, int index) {
        String itemcode = "itemcode_" + index;
        obj.setItemcode(itemcode);
    }
    
    public void ExpenseDataOnDemand.setPaidBy(Expense obj, int index) {
        Login paidBy = loginDataOnDemand.getRandomLogin();
        obj.setPaidBy(paidBy);
    }
    
    public void ExpenseDataOnDemand.setRemarks(Expense obj, int index) {
        String remarks = "remarks_" + index;
        obj.setRemarks(remarks);
    }
    
    public void ExpenseDataOnDemand.setTotalCost(Expense obj, int index) {
        Double totalCost = new Integer(index).doubleValue();
        obj.setTotalCost(totalCost);
    }
    
    public void ExpenseDataOnDemand.setXpdate(Expense obj, int index) {
        Date xpdate = new GregorianCalendar(Calendar.getInstance().get(Calendar.YEAR), Calendar.getInstance().get(Calendar.MONTH), Calendar.getInstance().get(Calendar.DAY_OF_MONTH), Calendar.getInstance().get(Calendar.HOUR_OF_DAY), Calendar.getInstance().get(Calendar.MINUTE), Calendar.getInstance().get(Calendar.SECOND) + new Double(Math.random() * 1000).intValue()).getTime();
        obj.setXpdate(xpdate);
    }
    
    public Expense ExpenseDataOnDemand.getSpecificExpense(int index) {
        init();
        if (index < 0) {
            index = 0;
        }
        if (index > (data.size() - 1)) {
            index = data.size() - 1;
        }
        Expense obj = data.get(index);
        Long id = obj.getId();
        return Expense.findExpense(id);
    }
    
    public Expense ExpenseDataOnDemand.getRandomExpense() {
        init();
        Expense obj = data.get(rnd.nextInt(data.size()));
        Long id = obj.getId();
        return Expense.findExpense(id);
    }
    
    public boolean ExpenseDataOnDemand.modifyExpense(Expense obj) {
        return false;
    }
    
    public void ExpenseDataOnDemand.init() {
        int from = 0;
        int to = 10;
        data = Expense.findExpenseEntries(from, to);
        if (data == null) {
            throw new IllegalStateException("Find entries implementation for 'Expense' illegally returned null");
        }
        if (!data.isEmpty()) {
            return;
        }
        
        data = new ArrayList<Expense>();
        for (int i = 0; i < 10; i++) {
            Expense obj = getNewTransientExpense(i);
            try {
                obj.persist();
            } catch (final ConstraintViolationException e) {
                final StringBuilder msg = new StringBuilder();
                for (Iterator<ConstraintViolation<?>> iter = e.getConstraintViolations().iterator(); iter.hasNext();) {
                    final ConstraintViolation<?> cv = iter.next();
                    msg.append("[").append(cv.getRootBean().getClass().getName()).append(".").append(cv.getPropertyPath()).append(": ").append(cv.getMessage()).append(" (invalid value = ").append(cv.getInvalidValue()).append(")").append("]");
                }
                throw new IllegalStateException(msg.toString(), e);
            }
            obj.flush();
            data.add(obj);
        }
    }
    
}
