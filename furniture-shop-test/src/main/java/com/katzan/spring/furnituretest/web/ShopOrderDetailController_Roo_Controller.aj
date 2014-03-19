// WARNING: DO NOT EDIT THIS FILE. THIS FILE IS MANAGED BY SPRING ROO.
// You may push code into the target .java compilation unit if you wish to edit any member(s).

package com.katzan.spring.furnituretest.web;

import com.katzan.spring.furnituretest.model.ShopOrderDetail;
import com.katzan.spring.furnituretest.repository.FurnitureItemRepository;
import com.katzan.spring.furnituretest.repository.ShopOrderDetailRepository;
import com.katzan.spring.furnituretest.web.ShopOrderDetailController;
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

privileged aspect ShopOrderDetailController_Roo_Controller {
    
    @Autowired
    ShopOrderDetailRepository ShopOrderDetailController.shopOrderDetailRepository;
    
    @Autowired
    FurnitureItemRepository ShopOrderDetailController.furnitureItemRepository;
    
    @RequestMapping(method = RequestMethod.POST, produces = "text/html")
    public String ShopOrderDetailController.create(@Valid ShopOrderDetail shopOrderDetail, BindingResult bindingResult, Model uiModel, HttpServletRequest httpServletRequest) {
        if (bindingResult.hasErrors()) {
            populateEditForm(uiModel, shopOrderDetail);
            return "shoporderdetails/create";
        }
        uiModel.asMap().clear();
        shopOrderDetailRepository.save(shopOrderDetail);
        return "redirect:/shoporderdetails/" + encodeUrlPathSegment(shopOrderDetail.getId().toString(), httpServletRequest);
    }
    
    @RequestMapping(params = "form", produces = "text/html")
    public String ShopOrderDetailController.createForm(Model uiModel) {
        populateEditForm(uiModel, new ShopOrderDetail());
        return "shoporderdetails/create";
    }
    
    @RequestMapping(value = "/{id}", produces = "text/html")
    public String ShopOrderDetailController.show(@PathVariable("id") Long id, Model uiModel) {
        uiModel.addAttribute("shoporderdetail", shopOrderDetailRepository.findOne(id));
        uiModel.addAttribute("itemId", id);
        return "shoporderdetails/show";
    }
    
    @RequestMapping(produces = "text/html")
    public String ShopOrderDetailController.list(@RequestParam(value = "page", required = false) Integer page, @RequestParam(value = "size", required = false) Integer size, @RequestParam(value = "sortFieldName", required = false) String sortFieldName, @RequestParam(value = "sortOrder", required = false) String sortOrder, Model uiModel) {
        if (page != null || size != null) {
            int sizeNo = size == null ? 10 : size.intValue();
            final int firstResult = page == null ? 0 : (page.intValue() - 1) * sizeNo;
            uiModel.addAttribute("shoporderdetails", shopOrderDetailRepository.findAll(new org.springframework.data.domain.PageRequest(firstResult / sizeNo, sizeNo)).getContent());
            float nrOfPages = (float) shopOrderDetailRepository.count() / sizeNo;
            uiModel.addAttribute("maxPages", (int) ((nrOfPages > (int) nrOfPages || nrOfPages == 0.0) ? nrOfPages + 1 : nrOfPages));
        } else {
            uiModel.addAttribute("shoporderdetails", shopOrderDetailRepository.findAll());
        }
        return "shoporderdetails/list";
    }
    
    @RequestMapping(method = RequestMethod.PUT, produces = "text/html")
    public String ShopOrderDetailController.update(@Valid ShopOrderDetail shopOrderDetail, BindingResult bindingResult, Model uiModel, HttpServletRequest httpServletRequest) {
        if (bindingResult.hasErrors()) {
            populateEditForm(uiModel, shopOrderDetail);
            return "shoporderdetails/update";
        }
        uiModel.asMap().clear();
        shopOrderDetailRepository.save(shopOrderDetail);
        return "redirect:/shoporderdetails/" + encodeUrlPathSegment(shopOrderDetail.getId().toString(), httpServletRequest);
    }
    
    @RequestMapping(value = "/{id}", params = "form", produces = "text/html")
    public String ShopOrderDetailController.updateForm(@PathVariable("id") Long id, Model uiModel) {
        populateEditForm(uiModel, shopOrderDetailRepository.findOne(id));
        return "shoporderdetails/update";
    }
    
    @RequestMapping(value = "/{id}", method = RequestMethod.DELETE, produces = "text/html")
    public String ShopOrderDetailController.delete(@PathVariable("id") Long id, @RequestParam(value = "page", required = false) Integer page, @RequestParam(value = "size", required = false) Integer size, Model uiModel) {
        ShopOrderDetail shopOrderDetail = shopOrderDetailRepository.findOne(id);
        shopOrderDetailRepository.delete(shopOrderDetail);
        uiModel.asMap().clear();
        uiModel.addAttribute("page", (page == null) ? "1" : page.toString());
        uiModel.addAttribute("size", (size == null) ? "10" : size.toString());
        return "redirect:/shoporderdetails";
    }
    
    void ShopOrderDetailController.populateEditForm(Model uiModel, ShopOrderDetail shopOrderDetail) {
        uiModel.addAttribute("shopOrderDetail", shopOrderDetail);
        uiModel.addAttribute("furnitureitems", furnitureItemRepository.findAll());
    }
    
    String ShopOrderDetailController.encodeUrlPathSegment(String pathSegment, HttpServletRequest httpServletRequest) {
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
