// WARNING: DO NOT EDIT THIS FILE. THIS FILE IS MANAGED BY SPRING ROO.
// You may push code into the target .java compilation unit if you wish to edit any member(s).

package com.nbad.xtrak.domain;

import com.nbad.xtrak.domain.Login;
import com.nbad.xtrak.domain.LoginDataOnDemand;
import com.nbad.xtrak.domain.LoginIntegrationTest;
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

privileged aspect LoginIntegrationTest_Roo_IntegrationTest {
    
    declare @type: LoginIntegrationTest: @RunWith(SpringJUnit4ClassRunner.class);
    
    declare @type: LoginIntegrationTest: @ContextConfiguration(locations = "classpath*:/META-INF/spring/applicationContext*.xml");
    
    declare @type: LoginIntegrationTest: @Transactional;
    
    @Autowired
    LoginDataOnDemand LoginIntegrationTest.dod;
    
    @Test
    public void LoginIntegrationTest.testCountLogins() {
        Assert.assertNotNull("Data on demand for 'Login' failed to initialize correctly", dod.getRandomLogin());
        long count = Login.countLogins();
        Assert.assertTrue("Counter for 'Login' incorrectly reported there were no entries", count > 0);
    }
    
    @Test
    public void LoginIntegrationTest.testFindLogin() {
        Login obj = dod.getRandomLogin();
        Assert.assertNotNull("Data on demand for 'Login' failed to initialize correctly", obj);
        Long id = obj.getId();
        Assert.assertNotNull("Data on demand for 'Login' failed to provide an identifier", id);
        obj = Login.findLogin(id);
        Assert.assertNotNull("Find method for 'Login' illegally returned null for id '" + id + "'", obj);
        Assert.assertEquals("Find method for 'Login' returned the incorrect identifier", id, obj.getId());
    }
    
    @Test
    public void LoginIntegrationTest.testFindAllLogins() {
        Assert.assertNotNull("Data on demand for 'Login' failed to initialize correctly", dod.getRandomLogin());
        long count = Login.countLogins();
        Assert.assertTrue("Too expensive to perform a find all test for 'Login', as there are " + count + " entries; set the findAllMaximum to exceed this value or set findAll=false on the integration test annotation to disable the test", count < 250);
        List<Login> result = Login.findAllLogins();
        Assert.assertNotNull("Find all method for 'Login' illegally returned null", result);
        Assert.assertTrue("Find all method for 'Login' failed to return any data", result.size() > 0);
    }
    
    @Test
    public void LoginIntegrationTest.testFindLoginEntries() {
        Assert.assertNotNull("Data on demand for 'Login' failed to initialize correctly", dod.getRandomLogin());
        long count = Login.countLogins();
        if (count > 20) count = 20;
        int firstResult = 0;
        int maxResults = (int) count;
        List<Login> result = Login.findLoginEntries(firstResult, maxResults);
        Assert.assertNotNull("Find entries method for 'Login' illegally returned null", result);
        Assert.assertEquals("Find entries method for 'Login' returned an incorrect number of entries", count, result.size());
    }
    
    @Test
    public void LoginIntegrationTest.testFlush() {
        Login obj = dod.getRandomLogin();
        Assert.assertNotNull("Data on demand for 'Login' failed to initialize correctly", obj);
        Long id = obj.getId();
        Assert.assertNotNull("Data on demand for 'Login' failed to provide an identifier", id);
        obj = Login.findLogin(id);
        Assert.assertNotNull("Find method for 'Login' illegally returned null for id '" + id + "'", obj);
        boolean modified =  dod.modifyLogin(obj);
        Integer currentVersion = obj.getVersion();
        obj.flush();
        Assert.assertTrue("Version for 'Login' failed to increment on flush directive", (currentVersion != null && obj.getVersion() > currentVersion) || !modified);
    }
    
    @Test
    public void LoginIntegrationTest.testMergeUpdate() {
        Login obj = dod.getRandomLogin();
        Assert.assertNotNull("Data on demand for 'Login' failed to initialize correctly", obj);
        Long id = obj.getId();
        Assert.assertNotNull("Data on demand for 'Login' failed to provide an identifier", id);
        obj = Login.findLogin(id);
        boolean modified =  dod.modifyLogin(obj);
        Integer currentVersion = obj.getVersion();
        Login merged = obj.merge();
        obj.flush();
        Assert.assertEquals("Identifier of merged object not the same as identifier of original object", merged.getId(), id);
        Assert.assertTrue("Version for 'Login' failed to increment on merge and flush directive", (currentVersion != null && obj.getVersion() > currentVersion) || !modified);
    }
    
    @Test
    public void LoginIntegrationTest.testPersist() {
        Assert.assertNotNull("Data on demand for 'Login' failed to initialize correctly", dod.getRandomLogin());
        Login obj = dod.getNewTransientLogin(Integer.MAX_VALUE);
        Assert.assertNotNull("Data on demand for 'Login' failed to provide a new transient entity", obj);
        Assert.assertNull("Expected 'Login' identifier to be null", obj.getId());
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
        Assert.assertNotNull("Expected 'Login' identifier to no longer be null", obj.getId());
    }
    
    @Test
    public void LoginIntegrationTest.testRemove() {
        Login obj = dod.getRandomLogin();
        Assert.assertNotNull("Data on demand for 'Login' failed to initialize correctly", obj);
        Long id = obj.getId();
        Assert.assertNotNull("Data on demand for 'Login' failed to provide an identifier", id);
        obj = Login.findLogin(id);
        obj.remove();
        obj.flush();
        Assert.assertNull("Failed to remove 'Login' with identifier '" + id + "'", Login.findLogin(id));
    }
    
}
