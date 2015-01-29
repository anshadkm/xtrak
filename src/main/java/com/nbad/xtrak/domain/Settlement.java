package com.nbad.xtrak.domain;

import java.text.DateFormatSymbols;
import java.util.ArrayList;
import java.util.Collections;
import java.util.Comparator;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

public class Settlement {
	
	private static final String[] MONTHS = new DateFormatSymbols().getMonths();
	private Login user;
	private int month;
	private double amountSpent;
	private double amountSettled;
	private double amountToSettle;
	
	public Login getUser() {
		return user;
	}

	public void setUser(Login user) {
		this.user = user;
	}

	public String getMonth() {
		return MONTHS[month];
	}

	public void setMonth(int month) {
		this.month = month;
	}

	public double getAmountSpent() {
		return amountSpent;
	}

	public void setAmountSpent(double amountSpent) {
		this.amountSpent = amountSpent;
	}

	public double getAmountSettled() {
		return amountSettled;
	}

	public void setAmountSettled(double amountSettled) {
		this.amountSettled = amountSettled;
	}

	public double getAmountToSettle() {
		return amountToSettle;
	}

	public void setAmountToSettle(double amountToSettle) {
		this.amountToSettle = amountToSettle;
	}

	public static List<Settlement> getAllSettlements() {
		
		Map<String, Settlement> settlements = new HashMap<String, Settlement>();
		Map<Long, Login> usersMap = new HashMap<Long, Login>();
		List<Object[]> expenses = Expense.getMonthWiseTotalCost();
		for (int i = 0; i < expenses.size(); i++) {
			Object[] xp = expenses.get(i);
			Long userid = (Long) xp[0];
			Integer month = (Integer) xp[1];
			Double sum = (Double) xp[2];
			Settlement settlement = new Settlement();
			if (usersMap.containsKey(userid)) {
				settlement.user = usersMap.get(userid);
			} else {
				settlement.user = Login.findLogin(userid);
				usersMap.put(userid, settlement.user);
			}
			settlement.month = month - 1;
			settlement.amountSpent = sum;
			settlements.put(userid + "#" + month, settlement);
		}
		
		List<Object[]> expenseDetails = ExpenseDetails.getMonthWiseTotalAmount();
		
		for (int i = 0; i < expenseDetails.size(); i++) {
			Object[] xp = expenseDetails.get(i);
			Long userid = (Long) xp[0];
			Integer month = (Integer) xp[1];
			Double sum = (Double) xp[2];
			Settlement settlement = new Settlement();
			if (settlements.containsKey(userid + "#" + month)) {
				settlement = settlements.get(userid + "#" + month);
			} else {
				if (usersMap.containsKey(userid)) {
					settlement.user = usersMap.get(userid);
				} else {
					settlement.user = Login.findLogin(userid);
					usersMap.put(userid, settlement.user);
				}
				settlement.month = month - 1;
				settlements.put(userid + "#" + month, settlement);
			}
			settlement.amountToSettle = sum;
		}
		
		List<Object[]> paymentDetails = Payments.getMonthWiseSettledAmount();
		
		for (int i = 0; i < paymentDetails.size(); i++) {
			Object[] xp = paymentDetails.get(i);
			Long userid = (Long) xp[0];
			Integer month = (Integer) xp[1];
			Double sum = (Double) xp[2];
			Settlement settlement = new Settlement();
			if (settlements.containsKey(userid + "#" + month)) {
				settlement = settlements.get(userid + "#" + month);
			} else {
				if (usersMap.containsKey(userid)) {
					settlement.user = usersMap.get(userid);
				} else {
					settlement.user = Login.findLogin(userid);
					usersMap.put(userid, settlement.user);
				}
				settlement.month = month - 1;
				settlements.put(userid + "#" + month, settlement);
			}
			settlement.amountSettled = sum;
		}
		List<Settlement> result = new ArrayList<Settlement>(settlements.values());
		Collections.sort(result, new Comparator<Settlement>() {
			@Override
			public int compare(Settlement o1, Settlement o2) {
				return o1.month > o2.month ? 1 : -1;
			}
			
		});
		return result;
	}

	@Override
	public String toString() {
		return "Settlement [user=" + user + ", month=" + month
				+ ", amountSpent=" + amountSpent + ", amountToSettle="
				+ amountToSettle + "]";
	}
	
}
