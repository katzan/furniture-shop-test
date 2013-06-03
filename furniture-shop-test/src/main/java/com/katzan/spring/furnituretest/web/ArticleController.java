package com.katzan.spring.furnituretest.web;

import com.katzan.spring.furnituretest.model.Article;
import org.springframework.roo.addon.web.mvc.controller.scaffold.RooWebScaffold;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@RequestMapping("/articles")
@Controller
@RooWebScaffold(path = "articles", formBackingObject = Article.class)
public class ArticleController {
}
