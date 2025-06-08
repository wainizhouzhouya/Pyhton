package com.ruoyi.project.system.category.controller;

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
import com.ruoyi.project.system.category.domain.ProductCategory;
import com.ruoyi.project.system.category.service.IProductCategoryService;
import com.ruoyi.framework.web.controller.BaseController;
import com.ruoyi.framework.web.domain.AjaxResult;
import com.ruoyi.common.utils.poi.ExcelUtil;
import com.ruoyi.framework.web.page.TableDataInfo;

/**
 * 商品分类Controller
 * 
 * @author ruoyi
 * @date 2022-03-10
 */
@Controller
@RequestMapping("/system/category")
public class ProductCategoryController extends BaseController
{
    private String prefix = "system/category";

    @Autowired
    private IProductCategoryService productCategoryService;

    @RequiresPermissions("system:category:view")
    @GetMapping()
    public String category()
    {
        return prefix + "/category";
    }

    /**
     * 查询商品分类列表
     */
    @RequiresPermissions("system:category:list")
    @PostMapping("/list")
    @ResponseBody
    public TableDataInfo list(ProductCategory productCategory)
    {
        startPage();
        List<ProductCategory> list = productCategoryService.selectProductCategoryList(productCategory);
        return getDataTable(list);
    }

    /**
     * 导出商品分类列表
     */
    @RequiresPermissions("system:category:export")
    @Log(title = "商品分类", businessType = BusinessType.EXPORT)
    @PostMapping("/export")
    @ResponseBody
    public AjaxResult export(ProductCategory productCategory)
    {
        List<ProductCategory> list = productCategoryService.selectProductCategoryList(productCategory);
        ExcelUtil<ProductCategory> util = new ExcelUtil<ProductCategory>(ProductCategory.class);
        return util.exportExcel(list, "商品分类数据");
    }

    /**
     * 新增商品分类
     */
    @GetMapping("/add")
    public String add()
    {
        return prefix + "/add";
    }

    /**
     * 新增保存商品分类
     */
    @RequiresPermissions("system:category:add")
    @Log(title = "商品分类", businessType = BusinessType.INSERT)
    @PostMapping("/add")
    @ResponseBody
    public AjaxResult addSave(ProductCategory productCategory)
    {
        return toAjax(productCategoryService.insertProductCategory(productCategory));
    }

    /**
     * 修改商品分类
     */
    @RequiresPermissions("system:category:edit")
    @GetMapping("/edit/{id}")
    public String edit(@PathVariable("id") Long id, ModelMap mmap)
    {
        ProductCategory productCategory = productCategoryService.selectProductCategoryById(id);
        mmap.put("productCategory", productCategory);
        return prefix + "/edit";
    }

    /**
     * 修改保存商品分类
     */
    @RequiresPermissions("system:category:edit")
    @Log(title = "商品分类", businessType = BusinessType.UPDATE)
    @PostMapping("/edit")
    @ResponseBody
    public AjaxResult editSave(ProductCategory productCategory)
    {
        return toAjax(productCategoryService.updateProductCategory(productCategory));
    }

    /**
     * 删除商品分类
     */
    @RequiresPermissions("system:category:remove")
    @Log(title = "商品分类", businessType = BusinessType.DELETE)
    @PostMapping( "/remove")
    @ResponseBody
    public AjaxResult remove(String ids)
    {
        return toAjax(productCategoryService.deleteProductCategoryByIds(ids));
    }
}
