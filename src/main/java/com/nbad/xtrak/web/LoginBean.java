package com.nbad.xtrak.web;
import com.nbad.xtrak.domain.Login;
import org.springframework.roo.addon.jsf.managedbean.RooJsfManagedBean;
import org.springframework.roo.addon.serializable.RooSerializable;

@RooSerializable
@RooJsfManagedBean(entity = Login.class, beanName = "loginBean")
public class LoginBean {
}
