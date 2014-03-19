// WARNING: DO NOT EDIT THIS FILE. THIS FILE IS MANAGED BY SPRING ROO.
// You may push code into the target .java compilation unit if you wish to edit any member(s).

package com.katzan.spring.furnituretest.web;

import com.katzan.spring.furnituretest.model.ShopOrder;
import com.katzan.spring.furnituretest.repository.ShopOrderRepository;
import com.katzan.spring.furnituretest.repository.UserAccountRepository;
import com.katzan.spring.furnituretest.web.ShopOrderController;
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

privileged aspect ShopOrderController_Roo_Controller {
    
    @Autowired
    ShopOrderRepository ShopOrderController.shopOrderRepository;
    
    @Autowired
    UserAccountRepository ShopOrderController.userAccountRepository;
    
    @RequestMapping(method = RequestMethod.POST, produces = "text/html")
    public String ShopOrderController.create(@Valid ShopOrder shopOrder, BindingResult bindingResult, Model uiModel, HttpServletRequest httpServletRequest) {
        if (bindingResult.hasErrors()) {
            populateEditForm(uiModel, shopOrder);
            return "shoporders/create";
        }
        uiModel.asMap().clear();
        shopOrderRepository.save(shopOrder);
        return "redirect:/shoporders/" + encodeUrlPathSegment(shopOrder.getId().toString(), httpServletRequest);
    }
    
    @RequestMapping(params = "form", produces = "text/html")
    public String ShopOrderController.createForm(Model uiModel) {
        populateEditForm(uiModel, new ShopOrder());
        return "shoporders/create";
    }
    
    @RequestMapping(value = "/{id}", produces = "text/html")
    public String ShopOrderController.show(@PathVariable("id") Long id, Model uiModel) {
        uiModel.addAttribute("shoporder", shopOrderRepository.findOne(id));
        uiModel.addAttribute("itemId", id);
        return "shoporders/show";
    }
    
    @RequestMapping(produces = "text/html")
    public String ShopOrderController.list(@RequestParam(value = "page", required = false) Integer page, @RequestParam(value = "size", required = false) Integer size, @RequestParam(value = "sortFieldName", required = false) String sortFieldName, @RequestParam(value = "sortOrder", required = false) String sortOrder, Model uiModel) {
        if (page != null || size != null) {
            int sizeNo = size == null ? 10 : size.intValue();
            final int firstResult = page == null ? 0 : (page.intValue() - 1) * sizeNo;
            uiModel.addAttribute("shoporders", shopOrderRepository.findAll(new org.springframework.data.domain.PageRequest(firstResult / sizeNo, sizeNo)).getContent());
            float nrOfPages = (float) shopOrderRepository.count() / sizeNo;
            uiModel.addAttribute("maxPages", (int) ((nrOfPages > (int) nrOfPages || nrOfPages == 0.0) ? nrOfPages + 1 : nrOfPages));
        } else {
            uiModel.addAttribute("shoporders", shopOrderRepository.findAll());
        }
        return "shoporders/list";
    }
    
    @RequestMapping(method = RequestMethod.PUT, produces = "text/html")
    public String ShopOrderController.update(@Valid ShopOrder shopOrder, BindingResult bindingResult, Model uiModel, HttpServletRequest httpServletRequest) {
        if (bindingResult.hasErrors()) {
            populateEditForm(uiModel, shopOrder);
            return "shoporders/update";
        }
        uiModel.asMap().clear();
        shopOrderRepository.save(shopOrder);
        return "redirect:/shoporders/" + encodeUrlPathSegment(shopOrder.getId().toString(), httpServletRequest);
    }
    
    @RequestMapping(value = "/{id}", params = "form", produces = "text/html")
    public String ShopOrderController.updateForm(@PathVariable("id") Long id, Model uiModel) {
        populateEditForm(uiModel, shopOrderRepository.findOne(id));
        return "shoporders/update";
    }
    
    @RequestMapping(value = "/{id}", method = RequestMethod.DELETE, produces = "text/html")
    public String ShopOrderController.delete(@PathVariable("id") Long id, @RequestParam(value = "page", required = false) Integer page, @RequestParam(value = "size", required = false) Integer size, Model uiModel) {
        ShopOrder shopOrder = shopOrderRepository.findOne(id);
        shopOrderRepository.delete(shopOrder);
        uiModel.asMap().clear();
        uiModel.addAttribute("page", (page == null) ? "1" : page.toString());
        uiModel.addAttribute("size", (size == null) ? "10" : size.toString());
        return "redirect:/shoporders";
    }
    
    void ShopOrderController.populateEditForm(Model uiModel, ShopOrder shopOrder) {
        uiModel.addAttribute("shopOrder", shopOrder);
        uiModel.addAttribute("useraccounts", userAccountRepository.findAll());
    }
    
    String ShopOrderController.encodeUrlPathSegment(String pathSegment, HttpServletRequest httpServletRequest) {
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
