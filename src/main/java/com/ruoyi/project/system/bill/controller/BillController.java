package com.ruoyi.project.system.bill.controller;

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
import com.ruoyi.project.system.bill.domain.Bill;
import com.ruoyi.project.system.bill.service.IBillService;
import com.ruoyi.framework.web.controller.BaseController;
import com.ruoyi.framework.web.domain.AjaxResult;
import com.ruoyi.common.utils.poi.ExcelUtil;
import com.ruoyi.framework.web.page.TableDataInfo;

/**
 * 销售账单Controller
 * 
 * @author ruoyi
 * @date 2022-03-11
 */
@Controller
@RequestMapping("/system/bill")
public class BillController extends BaseController
{
    private String prefix = "system/bill";

    @Autowired
    private IBillService billService;

    @RequiresPermissions("system:bill:view")
    @GetMapping()
    public String bill()
    {
        return prefix + "/bill";
    }

    /**
     * 查询销售账单列表
     */
    @RequiresPermissions("system:bill:list")
    @PostMapping("/list")
    @ResponseBody
    public TableDataInfo list(Bill bill)
    {
        startPage();
        List<Bill> list = billService.selectBillList(bill);
        return getDataTable(list);
    }

    /**
     * 导出销售账单列表
     */
    @RequiresPermissions("system:bill:export")
    @Log(title = "销售账单", businessType = BusinessType.EXPORT)
    @PostMapping("/export")
    @ResponseBody
    public AjaxResult export(Bill bill)
    {
        List<Bill> list = billService.selectBillList(bill);
        ExcelUtil<Bill> util = new ExcelUtil<Bill>(Bill.class);
        return util.exportExcel(list, "销售账单数据");
    }

    /**
     * 新增销售账单
     */
    @GetMapping("/add")
    public String add()
    {
        return prefix + "/add";
    }

    /**
     * 新增保存销售账单
     */
    @RequiresPermissions("system:bill:add")
    @Log(title = "销售账单", businessType = BusinessType.INSERT)
    @PostMapping("/add")
    @ResponseBody
    public AjaxResult addSave(Bill bill)
    {
        return toAjax(billService.insertBill(bill));
    }

    /**
     * 修改销售账单
     */
    @RequiresPermissions("system:bill:edit")
    @GetMapping("/edit/{id}")
    public String edit(@PathVariable("id") Long id, ModelMap mmap)
    {
        Bill bill = billService.selectBillById(id);
        mmap.put("bill", bill);
        return prefix + "/edit";
    }

    /**
     * 修改保存销售账单
     */
    @RequiresPermissions("system:bill:edit")
    @Log(title = "销售账单", businessType = BusinessType.UPDATE)
    @PostMapping("/edit")
    @ResponseBody
    public AjaxResult editSave(Bill bill)
    {
        return toAjax(billService.updateBill(bill));
    }

    /**
     * 删除销售账单
     */
    @RequiresPermissions("system:bill:remove")
    @Log(title = "销售账单", businessType = BusinessType.DELETE)
    @PostMapping( "/remove")
    @ResponseBody
    public AjaxResult remove(String ids)
    {
        return toAjax(billService.deleteBillByIds(ids));
    }
}
