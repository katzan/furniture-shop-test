package com.katzan.spring.furnituretest.web;

import com.katzan.spring.furnituretest.model.FurnitureItem;
import com.katzan.spring.furnituretest.util.ApplicationContextProvider;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.ApplicationContext;
import org.springframework.roo.addon.web.mvc.controller.scaffold.RooWebScaffold;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

@RequestMapping("/furnitureitems")
@Controller
@RooWebScaffold(path = "furnitureitems", formBackingObject = FurnitureItem.class)
public class FurnitureItemController {

	@RequestMapping(params = "form", produces = "text/html")
    public String createForm(Model uiModel) {
		ApplicationContext context = ApplicationContextProvider.getApplicationContext();
		if(context==null) {
			System.out.println("Application context is null!!!");
		}
		FurnitureItem item = (FurnitureItem) context.getBean("furnitureItem");
		System.out.println("Path to the server is: "+item.getServerPathString() );
        populateEditForm(uiModel, item);
        return "furnitureitems/create";
    }
}
