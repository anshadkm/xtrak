package com.nbad.xtrak.web.converter;
import com.nbad.xtrak.domain.ItemType;
import javax.faces.convert.Converter;
import org.springframework.roo.addon.jsf.converter.RooJsfConverter;

@RooJsfConverter(entity = ItemType.class)
public class ItemTypeConverter implements Converter {
}
