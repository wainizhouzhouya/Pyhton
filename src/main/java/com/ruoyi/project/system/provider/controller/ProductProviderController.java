package com.ruoyi.project.system.provider.controller;

import java.util.List;
import org.apache.shiro.authz.annotation.RequiresPermissions;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import com.ruoyi.framework.aspectj.lang.annotation.Log;
import com.ruoyi.framework.aspectj.lang.enums.BusinessType;
import com.ruoyi.project.system.provider.domain.ProductProvider;
import com.ruoyi.project.system.provider.service.IProductProviderService;
import com.ruoyi.framework.web.controller.BaseController;
import com.ruoyi.framework.web.domain.AjaxResult;
import com.ruoyi.common.utils.poi.ExcelUtil;
import com.ruoyi.framework.web.page.TableDataInfo;

/**
 * 供应商Controller
 * 
 * @author ruoyi
 * @date 2022-03-10
 */
@Controller
@RequestMapping("/system/provider")
public class ProductProviderController extends BaseController
{
    private String prefix = "system/provider";

    @Autowired
    private IProductProviderService productProviderService;

    @RequiresPermissions("system:provider:view")
    @GetMapping()
    public String provider()
    {
        return prefix + "/provider";
    }

    /**
     * 查询供应商列表
     */
    @RequiresPermissions("system:provider:list")
    @PostMapping("/list")
    @ResponseBody
    public TableDataInfo list(ProductProvider productProvider)
    {
        startPage();
        List<ProductProvider> list = productProviderService.selectProductProviderList(productProvider);
        return getDataTable(list);
    }

    /**
     * 导出供应商列表
     */
    @RequiresPermissions("system:provider:export")
    @Log(title = "供应商", businessType = BusinessType.EXPORT)
    @PostMapping("/export")
    @ResponseBody
    public AjaxResult export(ProductProvider productProvider)
    {
        List<ProductProvider> list = productProviderService.selectProductProviderList(productProvider);
        ExcelUtil<ProductProvider> util = new ExcelUtil<ProductProvider>(ProductProvider.class);
        return util.exportExcel(list, "供应商数据");
    }

    /**
     * 新增供应商
     */
    @GetMapping("/add")
    public String add()
    {
        return prefix + "/add";
    }

    /**
     * 新增保存供应商
     */
    @RequiresPermissions("system:provider:add")
    @Log(title = "供应商", businessType = BusinessType.INSERT)
    @PostMapping("/add")
    @ResponseBody
    public AjaxResult addSave(ProductProvider productProvider)
    {
        return toAjax(productProviderService.insertProductProvider(productProvider));
    }

    /**
     * 修改供应商
     */
    @RequiresPermissions("system:provider:edit")
    @GetMapping("/edit/{id}")
    public String edit(@PathVariable("id") Long id, ModelMap mmap)
    {
        ProductProvider productProvider = productProviderService.selectProductProviderById(id);
        mmap.put("productProvider", productProvider);
        return prefix + "/edit";
    }

    /**
     * 修改保存供应商
     */
    @RequiresPermissions("system:provider:edit")
    @Log(title = "供应商", businessType = BusinessType.UPDATE)
    @PostMapping("/edit")
    @ResponseBody
    public AjaxResult editSave(ProductProvider productProvider)
    {
        return toAjax(productProviderService.updateProductProvider(productProvider));
    }

    /**
     * 删除供应商
     */
    @RequiresPermissions("system:provider:remove")
    @Log(title = "供应商", businessType = BusinessType.DELETE)
    @PostMapping( "/remove")
    @ResponseBody
    public AjaxResult remove(String ids)
    {
        return toAjax(productProviderService.deleteProductProviderByIds(ids));
    }
}
