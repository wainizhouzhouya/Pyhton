package com.ruoyi.project.system.bill.service;

import java.util.List;
import com.ruoyi.project.system.bill.domain.Bill;

/**
 * 销售账单Service接口
 * 
 * @author ruoyi
 * @date 2022-03-11
 */
public interface IBillService 
{
    /**
     * 查询销售账单
     * 
     * @param id 销售账单主键
     * @return 销售账单
     */
    public Bill selectBillById(Long id);

    /**
     * 查询销售账单列表
     * 
     * @param bill 销售账单
     * @return 销售账单集合
     */
    public List<Bill> selectBillList(Bill bill);

    /**
     * 新增销售账单
     * 
     * @param bill 销售账单
     * @return 结果
     */
    public int insertBill(Bill bill);

    /**
     * 修改销售账单
     * 
     * @param bill 销售账单
     * @return 结果
     */
    public int updateBill(Bill bill);

    /**
     * 批量删除销售账单
     * 
     * @param ids 需要删除的销售账单主键集合
     * @return 结果
     */
    public int deleteBillByIds(String ids);

    /**
     * 删除销售账单信息
     * 
     * @param id 销售账单主键
     * @return 结果
     */
    public int deleteBillById(Long id);
}
