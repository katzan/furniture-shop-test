// WARNING: DO NOT EDIT THIS FILE. THIS FILE IS MANAGED BY SPRING ROO.
// You may push code into the target .java compilation unit if you wish to edit any member(s).

package com.katzan.spring.furnituretest.web;

import com.katzan.spring.furnituretest.model.AboutUs;
import com.katzan.spring.furnituretest.repository.AboutUsRepository;
import com.katzan.spring.furnituretest.web.AboutUsController;
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

privileged aspect AboutUsController_Roo_Controller {
    
    @Autowired
    AboutUsRepository AboutUsController.aboutUsRepository;
    
    @RequestMapping(method = RequestMethod.POST, produces = "text/html")
    public String AboutUsController.create(@Valid AboutUs aboutUs, BindingResult bindingResult, Model uiModel, HttpServletRequest httpServletRequest) {
        if (bindingResult.hasErrors()) {
            populateEditForm(uiModel, aboutUs);
            return "aboutuses/create";
        }
        uiModel.asMap().clear();
        aboutUsRepository.save(aboutUs);
        return "redirect:/aboutuses/" + encodeUrlPathSegment(aboutUs.getId().toString(), httpServletRequest);
    }
    
    @RequestMapping(params = "form", produces = "text/html")
    public String AboutUsController.createForm(Model uiModel) {
        populateEditForm(uiModel, new AboutUs());
        return "aboutuses/create";
    }
    
    @RequestMapping(value = "/{id}", produces = "text/html")
    public String AboutUsController.show(@PathVariable("id") Long id, Model uiModel) {
        uiModel.addAttribute("aboutus", aboutUsRepository.findOne(id));
        uiModel.addAttribute("itemId", id);
        return "aboutuses/show";
    }
    
    @RequestMapping(produces = "text/html")
    public String AboutUsController.list(@RequestParam(value = "page", required = false) Integer page, @RequestParam(value = "size", required = false) Integer size, @RequestParam(value = "sortFieldName", required = false) String sortFieldName, @RequestParam(value = "sortOrder", required = false) String sortOrder, Model uiModel) {
        if (page != null || size != null) {
            int sizeNo = size == null ? 10 : size.intValue();
            final int firstResult = page == null ? 0 : (page.intValue() - 1) * sizeNo;
            uiModel.addAttribute("aboutuses", aboutUsRepository.findAll(new org.springframework.data.domain.PageRequest(firstResult / sizeNo, sizeNo)).getContent());
            float nrOfPages = (float) aboutUsRepository.count() / sizeNo;
            uiModel.addAttribute("maxPages", (int) ((nrOfPages > (int) nrOfPages || nrOfPages == 0.0) ? nrOfPages + 1 : nrOfPages));
        } else {
            uiModel.addAttribute("aboutuses", aboutUsRepository.findAll());
        }
        return "aboutuses/list";
    }
    
    @RequestMapping(method = RequestMethod.PUT, produces = "text/html")
    public String AboutUsController.update(@Valid AboutUs aboutUs, BindingResult bindingResult, Model uiModel, HttpServletRequest httpServletRequest) {
        if (bindingResult.hasErrors()) {
            populateEditForm(uiModel, aboutUs);
            return "aboutuses/update";
        }
        uiModel.asMap().clear();
        aboutUsRepository.save(aboutUs);
        return "redirect:/aboutuses/" + encodeUrlPathSegment(aboutUs.getId().toString(), httpServletRequest);
    }
    
    @RequestMapping(value = "/{id}", params = "form", produces = "text/html")
    public String AboutUsController.updateForm(@PathVariable("id") Long id, Model uiModel) {
        populateEditForm(uiModel, aboutUsRepository.findOne(id));
        return "aboutuses/update";
    }
    
    @RequestMapping(value = "/{id}", method = RequestMethod.DELETE, produces = "text/html")
    public String AboutUsController.delete(@PathVariable("id") Long id, @RequestParam(value = "page", required = false) Integer page, @RequestParam(value = "size", required = false) Integer size, Model uiModel) {
        AboutUs aboutUs = aboutUsRepository.findOne(id);
        aboutUsRepository.delete(aboutUs);
        uiModel.asMap().clear();
        uiModel.addAttribute("page", (page == null) ? "1" : page.toString());
        uiModel.addAttribute("size", (size == null) ? "10" : size.toString());
        return "redirect:/aboutuses";
    }
    
    void AboutUsController.populateEditForm(Model uiModel, AboutUs aboutUs) {
        uiModel.addAttribute("aboutUs", aboutUs);
    }
    
    String AboutUsController.encodeUrlPathSegment(String pathSegment, HttpServletRequest httpServletRequest) {
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
