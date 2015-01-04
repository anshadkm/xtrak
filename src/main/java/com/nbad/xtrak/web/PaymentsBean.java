package com.nbad.xtrak.web;
import com.nbad.xtrak.domain.Payments;
import org.springframework.roo.addon.jsf.managedbean.RooJsfManagedBean;
import org.springframework.roo.addon.serializable.RooSerializable;

@RooSerializable
@RooJsfManagedBean(entity = Payments.class, beanName = "paymentsBean")
public class PaymentsBean {
	
	public void getSettlementDetails() {
		
	}
	
}
