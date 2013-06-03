package com.katzan.spring.furnituretest.web;

import com.katzan.spring.furnituretest.model.FurnitureCategory;
import org.springframework.roo.addon.web.mvc.controller.scaffold.RooWebScaffold;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@RequestMapping("/furniturecategorys")
@Controller
@RooWebScaffold(path = "furniturecategorys", formBackingObject = FurnitureCategory.class)
public class FurnitureCategoryController {
}
