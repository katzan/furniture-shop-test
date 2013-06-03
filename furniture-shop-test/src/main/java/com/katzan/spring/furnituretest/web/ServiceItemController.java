package com.katzan.spring.furnituretest.web;

import com.katzan.spring.furnituretest.model.ServiceItem;
import org.springframework.roo.addon.web.mvc.controller.scaffold.RooWebScaffold;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@RequestMapping("/serviceitems")
@Controller
@RooWebScaffold(path = "serviceitems", formBackingObject = ServiceItem.class)
public class ServiceItemController {
}
