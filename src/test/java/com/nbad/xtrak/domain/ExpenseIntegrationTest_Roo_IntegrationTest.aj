// WARNING: DO NOT EDIT THIS FILE. THIS FILE IS MANAGED BY SPRING ROO.
// You may push code into the target .java compilation unit if you wish to edit any member(s).

package com.nbad.xtrak.domain;

import com.nbad.xtrak.domain.Expense;
import com.nbad.xtrak.domain.ExpenseDataOnDemand;
import com.nbad.xtrak.domain.ExpenseIntegrationTest;
import java.util.Iterator;
import java.util.List;
import javax.validation.ConstraintViolation;
import javax.validation.ConstraintViolationException;
import org.junit.Assert;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;
import org.springframework.transaction.annotation.Transactional;

privileged aspect ExpenseIntegrationTest_Roo_IntegrationTest {
    
    declare @type: ExpenseIntegrationTest: @RunWith(SpringJUnit4ClassRunner.class);
    
    declare @type: ExpenseIntegrationTest: @ContextConfiguration(locations = "classpath*:/META-INF/spring/applicationContext*.xml");
    
    declare @type: ExpenseIntegrationTest: @Transactional;
    
    @Autowired
    ExpenseDataOnDemand ExpenseIntegrationTest.dod;
    
    @Test
    public void ExpenseIntegrationTest.testCountExpenses() {
        Assert.assertNotNull("Data on demand for 'Expense' failed to initialize correctly", dod.getRandomExpense());
        long count = Expense.countExpenses();
        Assert.assertTrue("Counter for 'Expense' incorrectly reported there were no entries", count > 0);
    }
    
    @Test
    public void ExpenseIntegrationTest.testFindExpense() {
        Expense obj = dod.getRandomExpense();
        Assert.assertNotNull("Data on demand for 'Expense' failed to initialize correctly", obj);
        Long id = obj.getId();
        Assert.assertNotNull("Data on demand for 'Expense' failed to provide an identifier", id);
        obj = Expense.findExpense(id);
        Assert.assertNotNull("Find method for 'Expense' illegally returned null for id '" + id + "'", obj);
        Assert.assertEquals("Find method for 'Expense' returned the incorrect identifier", id, obj.getId());
    }
    
    @Test
    public void ExpenseIntegrationTest.testFindAllExpenses() {
        Assert.assertNotNull("Data on demand for 'Expense' failed to initialize correctly", dod.getRandomExpense());
        long count = Expense.countExpenses();
        Assert.assertTrue("Too expensive to perform a find all test for 'Expense', as there are " + count + " entries; set the findAllMaximum to exceed this value or set findAll=false on the integration test annotation to disable the test", count < 250);
        List<Expense> result = Expense.findAllExpenses();
        Assert.assertNotNull("Find all method for 'Expense' illegally returned null", result);
        Assert.assertTrue("Find all method for 'Expense' failed to return any data", result.size() > 0);
    }
    
    @Test
    public void ExpenseIntegrationTest.testFindExpenseEntries() {
        Assert.assertNotNull("Data on demand for 'Expense' failed to initialize correctly", dod.getRandomExpense());
        long count = Expense.countExpenses();
        if (count > 20) count = 20;
        int firstResult = 0;
        int maxResults = (int) count;
        List<Expense> result = Expense.findExpenseEntries(firstResult, maxResults);
        Assert.assertNotNull("Find entries method for 'Expense' illegally returned null", result);
        Assert.assertEquals("Find entries method for 'Expense' returned an incorrect number of entries", count, result.size());
    }
    
    @Test
    public void ExpenseIntegrationTest.testFlush() {
        Expense obj = dod.getRandomExpense();
        Assert.assertNotNull("Data on demand for 'Expense' failed to initialize correctly", obj);
        Long id = obj.getId();
        Assert.assertNotNull("Data on demand for 'Expense' failed to provide an identifier", id);
        obj = Expense.findExpense(id);
        Assert.assertNotNull("Find method for 'Expense' illegally returned null for id '" + id + "'", obj);
        boolean modified =  dod.modifyExpense(obj);
        Integer currentVersion = obj.getVersion();
        obj.flush();
        Assert.assertTrue("Version for 'Expense' failed to increment on flush directive", (currentVersion != null && obj.getVersion() > currentVersion) || !modified);
    }
    
    @Test
    public void ExpenseIntegrationTest.testMergeUpdate() {
        Expense obj = dod.getRandomExpense();
        Assert.assertNotNull("Data on demand for 'Expense' failed to initialize correctly", obj);
        Long id = obj.getId();
        Assert.assertNotNull("Data on demand for 'Expense' failed to provide an identifier", id);
        obj = Expense.findExpense(id);
        boolean modified =  dod.modifyExpense(obj);
        Integer currentVersion = obj.getVersion();
        Expense merged = obj.merge();
        obj.flush();
        Assert.assertEquals("Identifier of merged object not the same as identifier of original object", merged.getId(), id);
        Assert.assertTrue("Version for 'Expense' failed to increment on merge and flush directive", (currentVersion != null && obj.getVersion() > currentVersion) || !modified);
    }
    
    @Test
    public void ExpenseIntegrationTest.testPersist() {
        Assert.assertNotNull("Data on demand for 'Expense' failed to initialize correctly", dod.getRandomExpense());
        Expense obj = dod.getNewTransientExpense(Integer.MAX_VALUE);
        Assert.assertNotNull("Data on demand for 'Expense' failed to provide a new transient entity", obj);
        Assert.assertNull("Expected 'Expense' identifier to be null", obj.getId());
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
        Assert.assertNotNull("Expected 'Expense' identifier to no longer be null", obj.getId());
    }
    
    @Test
    public void ExpenseIntegrationTest.testRemove() {
        Expense obj = dod.getRandomExpense();
        Assert.assertNotNull("Data on demand for 'Expense' failed to initialize correctly", obj);
        Long id = obj.getId();
        Assert.assertNotNull("Data on demand for 'Expense' failed to provide an identifier", id);
        obj = Expense.findExpense(id);
        obj.remove();
        obj.flush();
        Assert.assertNull("Failed to remove 'Expense' with identifier '" + id + "'", Expense.findExpense(id));
    }
    
}
