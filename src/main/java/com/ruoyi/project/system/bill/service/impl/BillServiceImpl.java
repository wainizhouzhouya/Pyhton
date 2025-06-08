package com.ruoyi.project.system.bill.service.impl;

import com.ruoyi.project.system.category.domain.ProductCategory;
import com.ruoyi.project.system.category.service.IProductCategoryService;
import java.util.List;
import com.ruoyi.common.utils.DateUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import com.ruoyi.project.system.bill.mapper.BillMapper;
import com.ruoyi.project.system.bill.domain.Bill;
import com.ruoyi.project.system.bill.service.IBillService;
import com.ruoyi.common.utils.text.Convert;

/**
 * 销售账单Service业务层处理
 * 
 * @author ruoyi
 * @date 2022-03-11
 */
@Service
public class BillServiceImpl implements IBillService 
{
    @Autowired
    private BillMapper billMapper;

    @Autowired
    private IProductCategoryService productCategoryService;

    /**
     * 查询销售账单
     * 
     * @param id 销售账单主键
     * @return 销售账单
     */
    @Override
    public Bill selectBillById(Long id)
    {
        return billMapper.selectBillById(id);
    }

    /**
     * 查询销售账单列表
     * 
     * @param bill 销售账单
     * @return 销售账单
     */
    @Override
    public List<Bill> selectBillList(Bill bill)
    {
        return billMapper.selectBillList(bill);
    }

    /**
     * 新增销售账单
     * 
     * @param bill 销售账单
     * @return 结果
     */
    @Override
    public int insertBill(Bill bill)
    {
        bill.setCreateTime(DateUtils.getNowDate());
        if (bill.getCategoryId() != null && bill.getCategoryName() == null) {
            ProductCategory productCategory = productCategoryService
                .selectProductCategoryById(bill.getCategoryId());
            bill.setCategoryName(productCategory.getName());
        }
        return billMapper.insertBill(bill);
    }

    /**
     * 修改销售账单
     * 
     * @param bill 销售账单
     * @return 结果
     */
    @Override
    public int updateBill(Bill bill)
    {
        return billMapper.updateBill(bill);
    }

    /**
     * 批量删除销售账单
     * 
     * @param ids 需要删除的销售账单主键
     * @return 结果
     */
    @Override
    public int deleteBillByIds(String ids)
    {
        return billMapper.deleteBillByIds(Convert.toStrArray(ids));
    }

    /**
     * 删除销售账单信息
     * 
     * @param id 销售账单主键
     * @return 结果
     */
    @Override
    public int deleteBillById(Long id)
    {
        return billMapper.deleteBillById(id);
    }
}
