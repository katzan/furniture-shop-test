package com.katzan.spring.furnituretest.web;

import com.katzan.spring.furnituretest.model.ImageFile;
import org.springframework.roo.addon.web.mvc.controller.scaffold.RooWebScaffold;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@RequestMapping("/imagefiles")
@Controller
@RooWebScaffold(path = "imagefiles", formBackingObject = ImageFile.class)
public class ImageFileController {
}
