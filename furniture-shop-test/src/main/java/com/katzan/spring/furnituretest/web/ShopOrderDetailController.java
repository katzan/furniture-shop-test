package com.katzan.spring.furnituretest.web;

import com.katzan.spring.furnituretest.model.ShopOrderDetail;
import org.springframework.roo.addon.web.mvc.controller.scaffold.RooWebScaffold;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@RequestMapping("/shoporderdetails")
@Controller
@RooWebScaffold(path = "shoporderdetails", formBackingObject = ShopOrderDetail.class)
public class ShopOrderDetailController {
}
