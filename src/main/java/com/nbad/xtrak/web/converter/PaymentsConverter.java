package com.nbad.xtrak.web.converter;
import com.nbad.xtrak.domain.Payments;
import javax.faces.convert.Converter;
import org.springframework.roo.addon.jsf.converter.RooJsfConverter;

@RooJsfConverter(entity = Payments.class)
public class PaymentsConverter implements Converter {
}
