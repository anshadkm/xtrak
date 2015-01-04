package com.nbad.xtrak.web.converter;
import com.nbad.xtrak.domain.Login;
import javax.faces.convert.Converter;
import org.springframework.roo.addon.jsf.converter.RooJsfConverter;

@RooJsfConverter(entity = Login.class)
public class LoginConverter implements Converter {
}
