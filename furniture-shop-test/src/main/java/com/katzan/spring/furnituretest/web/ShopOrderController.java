package com.katzan.spring.furnituretest.web;

import com.katzan.spring.furnituretest.model.ShopOrder;
import org.springframework.roo.addon.web.mvc.controller.scaffold.RooWebScaffold;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@RequestMapping("/shoporders")
@Controller
@RooWebScaffold(path = "shoporders", formBackingObject = ShopOrder.class)
public class ShopOrderController {
}
