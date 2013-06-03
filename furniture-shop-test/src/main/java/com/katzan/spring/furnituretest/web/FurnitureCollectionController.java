package com.katzan.spring.furnituretest.web;

import com.katzan.spring.furnituretest.model.FurnitureCollection;
import org.springframework.roo.addon.web.mvc.controller.scaffold.RooWebScaffold;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@RequestMapping("/furniturecollections")
@Controller
@RooWebScaffold(path = "furniturecollections", formBackingObject = FurnitureCollection.class)
public class FurnitureCollectionController {
}
