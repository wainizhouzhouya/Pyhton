package com.ruoyi.project.system.provider.service;

import java.util.List;
import com.ruoyi.project.system.provider.domain.ProductProvider;

/**
 * 供应商Service接口
 * 
 * @author ruoyi
 * @date 2022-03-10
 */
public interface IProductProviderService 
{
    /**
     * 查询供应商
     * 
     * @param id 供应商主键
     * @return 供应商
     */
    public ProductProvider selectProductProviderById(Long id);

    /**
     * 查询供应商列表
     * 
     * @param productProvider 供应商
     * @return 供应商集合
     */
    public List<ProductProvider> selectProductProviderList(ProductProvider productProvider);

    /**
     * 新增供应商
     * 
     * @param productProvider 供应商
     * @return 结果
     */
    public int insertProductProvider(ProductProvider productProvider);

    /**
     * 修改供应商
     * 
     * @param productProvider 供应商
     * @return 结果
     */
    public int updateProductProvider(ProductProvider productProvider);

    /**
     * 批量删除供应商
     * 
     * @param ids 需要删除的供应商主键集合
     * @return 结果
     */
    public int deleteProductProviderByIds(String ids);

    /**
     * 删除供应商信息
     * 
     * @param id 供应商主键
     * @return 结果
     */
    public int deleteProductProviderById(Long id);
}
