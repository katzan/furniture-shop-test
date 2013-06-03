package com.katzan.spring.furnituretest.web;

import com.katzan.spring.furnituretest.model.Big;
import org.springframework.roo.addon.web.mvc.controller.scaffold.RooWebScaffold;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@RequestMapping("/bigs")
@Controller
@RooWebScaffold(path = "bigs", formBackingObject = Big.class)
public class BigController {
}
