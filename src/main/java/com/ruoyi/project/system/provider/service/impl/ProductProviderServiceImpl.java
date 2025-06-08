package com.ruoyi.project.system.provider.service.impl;

import java.util.List;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import com.ruoyi.project.system.provider.mapper.ProductProviderMapper;
import com.ruoyi.project.system.provider.domain.ProductProvider;
import com.ruoyi.project.system.provider.service.IProductProviderService;
import com.ruoyi.common.utils.text.Convert;

/**
 * 供应商Service业务层处理
 * 
 * @author ruoyi
 * @date 2022-03-10
 */
@Service
public class ProductProviderServiceImpl implements IProductProviderService 
{
    @Autowired
    private ProductProviderMapper productProviderMapper;

    /**
     * 查询供应商
     * 
     * @param id 供应商主键
     * @return 供应商
     */
    @Override
    public ProductProvider selectProductProviderById(Long id)
    {
        return productProviderMapper.selectProductProviderById(id);
    }

    /**
     * 查询供应商列表
     * 
     * @param productProvider 供应商
     * @return 供应商
     */
    @Override
    public List<ProductProvider> selectProductProviderList(ProductProvider productProvider)
    {
        return productProviderMapper.selectProductProviderList(productProvider);
    }

    /**
     * 新增供应商
     * 
     * @param productProvider 供应商
     * @return 结果
     */
    @Override
    public int insertProductProvider(ProductProvider productProvider)
    {
        return productProviderMapper.insertProductProvider(productProvider);
    }

    /**
     * 修改供应商
     * 
     * @param productProvider 供应商
     * @return 结果
     */
    @Override
    public int updateProductProvider(ProductProvider productProvider)
    {
        return productProviderMapper.updateProductProvider(productProvider);
    }

    /**
     * 批量删除供应商
     * 
     * @param ids 需要删除的供应商主键
     * @return 结果
     */
    @Override
    public int deleteProductProviderByIds(String ids)
    {
        return productProviderMapper.deleteProductProviderByIds(Convert.toStrArray(ids));
    }

    /**
     * 删除供应商信息
     * 
     * @param id 供应商主键
     * @return 结果
     */
    @Override
    public int deleteProductProviderById(Long id)
    {
        return productProviderMapper.deleteProductProviderById(id);
    }
}
