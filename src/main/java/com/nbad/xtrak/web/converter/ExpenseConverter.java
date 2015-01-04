package com.nbad.xtrak.web.converter;
import com.nbad.xtrak.domain.Expense;
import javax.faces.convert.Converter;
import org.springframework.roo.addon.jsf.converter.RooJsfConverter;

@RooJsfConverter(entity = Expense.class)
public class ExpenseConverter implements Converter {
}
