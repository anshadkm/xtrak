package com.nbad.xtrak.web.converter;
import com.nbad.xtrak.domain.ExpenseDetails;
import javax.faces.convert.Converter;
import org.springframework.roo.addon.jsf.converter.RooJsfConverter;

@RooJsfConverter(entity = ExpenseDetails.class)
public class ExpenseDetailsConverter implements Converter {
}
