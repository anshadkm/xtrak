package com.nbad.xtrak.web;
import com.nbad.xtrak.domain.ItemType;
import org.springframework.roo.addon.jsf.managedbean.RooJsfManagedBean;
import org.springframework.roo.addon.serializable.RooSerializable;

@RooSerializable
@RooJsfManagedBean(entity = ItemType.class, beanName = "itemTypeBean")
public class ItemTypeBean {
}
