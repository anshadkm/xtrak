package com.nbad.xtrak.web;
import java.util.List;

import org.springframework.roo.addon.jsf.managedbean.RooJsfManagedBean;
import org.springframework.roo.addon.serializable.RooSerializable;

import com.nbad.xtrak.domain.Payments;
import com.nbad.xtrak.domain.Settlement;

@RooSerializable
@RooJsfManagedBean(entity = Payments.class, beanName = "paymentsBean")
public class PaymentsBean {
	
	public List<Settlement> getSettlementDetails() {
		return Settlement.getAllSettlements();
	}
	
}
