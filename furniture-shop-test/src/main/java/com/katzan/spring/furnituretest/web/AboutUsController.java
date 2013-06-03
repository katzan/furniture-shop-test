package com.katzan.spring.furnituretest.web;

import com.katzan.spring.furnituretest.model.AboutUs;
import org.springframework.roo.addon.web.mvc.controller.scaffold.RooWebScaffold;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@RequestMapping("/aboutuses")
@Controller
@RooWebScaffold(path = "aboutuses", formBackingObject = AboutUs.class)
public class AboutUsController {
}
