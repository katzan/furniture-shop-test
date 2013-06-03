package com.katzan.spring.furnituretest.web;

import com.katzan.spring.furnituretest.model.FurnitureNews;
import org.springframework.roo.addon.web.mvc.controller.scaffold.RooWebScaffold;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@RequestMapping("/furniturenewses")
@Controller
@RooWebScaffold(path = "furniturenewses", formBackingObject = FurnitureNews.class)
public class FurnitureNewsController {
}
