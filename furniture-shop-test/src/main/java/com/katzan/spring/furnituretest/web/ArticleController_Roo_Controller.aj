// WARNING: DO NOT EDIT THIS FILE. THIS FILE IS MANAGED BY SPRING ROO.
// You may push code into the target .java compilation unit if you wish to edit any member(s).

package com.katzan.spring.furnituretest.web;

import com.katzan.spring.furnituretest.model.Article;
import com.katzan.spring.furnituretest.repository.ArticleRepository;
import com.katzan.spring.furnituretest.web.ArticleController;
import java.io.UnsupportedEncodingException;
import javax.servlet.http.HttpServletRequest;
import javax.validation.Valid;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.util.UriUtils;
import org.springframework.web.util.WebUtils;

privileged aspect ArticleController_Roo_Controller {
    
    @Autowired
    ArticleRepository ArticleController.articleRepository;
    
    @RequestMapping(method = RequestMethod.POST, produces = "text/html")
    public String ArticleController.create(@Valid Article article, BindingResult bindingResult, Model uiModel, HttpServletRequest httpServletRequest) {
        if (bindingResult.hasErrors()) {
            populateEditForm(uiModel, article);
            return "articles/create";
        }
        uiModel.asMap().clear();
        articleRepository.save(article);
        return "redirect:/articles/" + encodeUrlPathSegment(article.getId().toString(), httpServletRequest);
    }
    
    @RequestMapping(params = "form", produces = "text/html")
    public String ArticleController.createForm(Model uiModel) {
        populateEditForm(uiModel, new Article());
        return "articles/create";
    }
    
    @RequestMapping(value = "/{id}", produces = "text/html")
    public String ArticleController.show(@PathVariable("id") Long id, Model uiModel) {
        uiModel.addAttribute("article", articleRepository.findOne(id));
        uiModel.addAttribute("itemId", id);
        return "articles/show";
    }
    
    @RequestMapping(produces = "text/html")
    public String ArticleController.list(@RequestParam(value = "page", required = false) Integer page, @RequestParam(value = "size", required = false) Integer size, @RequestParam(value = "sortFieldName", required = false) String sortFieldName, @RequestParam(value = "sortOrder", required = false) String sortOrder, Model uiModel) {
        if (page != null || size != null) {
            int sizeNo = size == null ? 10 : size.intValue();
            final int firstResult = page == null ? 0 : (page.intValue() - 1) * sizeNo;
            uiModel.addAttribute("articles", articleRepository.findAll(new org.springframework.data.domain.PageRequest(firstResult / sizeNo, sizeNo)).getContent());
            float nrOfPages = (float) articleRepository.count() / sizeNo;
            uiModel.addAttribute("maxPages", (int) ((nrOfPages > (int) nrOfPages || nrOfPages == 0.0) ? nrOfPages + 1 : nrOfPages));
        } else {
            uiModel.addAttribute("articles", articleRepository.findAll());
        }
        return "articles/list";
    }
    
    @RequestMapping(method = RequestMethod.PUT, produces = "text/html")
    public String ArticleController.update(@Valid Article article, BindingResult bindingResult, Model uiModel, HttpServletRequest httpServletRequest) {
        if (bindingResult.hasErrors()) {
            populateEditForm(uiModel, article);
            return "articles/update";
        }
        uiModel.asMap().clear();
        articleRepository.save(article);
        return "redirect:/articles/" + encodeUrlPathSegment(article.getId().toString(), httpServletRequest);
    }
    
    @RequestMapping(value = "/{id}", params = "form", produces = "text/html")
    public String ArticleController.updateForm(@PathVariable("id") Long id, Model uiModel) {
        populateEditForm(uiModel, articleRepository.findOne(id));
        return "articles/update";
    }
    
    @RequestMapping(value = "/{id}", method = RequestMethod.DELETE, produces = "text/html")
    public String ArticleController.delete(@PathVariable("id") Long id, @RequestParam(value = "page", required = false) Integer page, @RequestParam(value = "size", required = false) Integer size, Model uiModel) {
        Article article = articleRepository.findOne(id);
        articleRepository.delete(article);
        uiModel.asMap().clear();
        uiModel.addAttribute("page", (page == null) ? "1" : page.toString());
        uiModel.addAttribute("size", (size == null) ? "10" : size.toString());
        return "redirect:/articles";
    }
    
    void ArticleController.populateEditForm(Model uiModel, Article article) {
        uiModel.addAttribute("article", article);
    }
    
    String ArticleController.encodeUrlPathSegment(String pathSegment, HttpServletRequest httpServletRequest) {
        String enc = httpServletRequest.getCharacterEncoding();
        if (enc == null) {
            enc = WebUtils.DEFAULT_CHARACTER_ENCODING;
        }
        try {
            pathSegment = UriUtils.encodePathSegment(pathSegment, enc);
        } catch (UnsupportedEncodingException uee) {}
        return pathSegment;
    }
    
}
