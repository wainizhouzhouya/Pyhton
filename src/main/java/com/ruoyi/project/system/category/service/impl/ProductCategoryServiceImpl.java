package com.ruoyi.project.system.category.service.impl;

import java.util.List;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import com.ruoyi.project.system.category.mapper.ProductCategoryMapper;
import com.ruoyi.project.system.category.domain.ProductCategory;
import com.ruoyi.project.system.category.service.IProductCategoryService;
import com.ruoyi.common.utils.text.Convert;

/**
 * 商品分类Service业务层处理
 * 
 * @author ruoyi
 * @date 2022-03-10
 */
@Service
public class ProductCategoryServiceImpl implements IProductCategoryService 
{
    @Autowired
    private ProductCategoryMapper productCategoryMapper;

    /**
     * 查询商品分类
     * 
     * @param id 商品分类主键
     * @return 商品分类
     */
    @Override
    public ProductCategory selectProductCategoryById(Long id)
    {
        return productCategoryMapper.selectProductCategoryById(id);
    }

    /**
     * 查询商品分类列表
     * 
     * @param productCategory 商品分类
     * @return 商品分类
     */
    @Override
    public List<ProductCategory> selectProductCategoryList(ProductCategory productCategory)
    {
        return productCategoryMapper.selectProductCategoryList(productCategory);
    }

    /**
     * 新增商品分类
     * 
     * @param productCategory 商品分类
     * @return 结果
     */
    @Override
    public int insertProductCategory(ProductCategory productCategory)
    {
        return productCategoryMapper.insertProductCategory(productCategory);
    }

    /**
     * 修改商品分类
     * 
     * @param productCategory 商品分类
     * @return 结果
     */
    @Override
    public int updateProductCategory(ProductCategory productCategory)
    {
        return productCategoryMapper.updateProductCategory(productCategory);
    }

    /**
     * 批量删除商品分类
     * 
     * @param ids 需要删除的商品分类主键
     * @return 结果
     */
    @Override
    public int deleteProductCategoryByIds(String ids)
    {
        return productCategoryMapper.deleteProductCategoryByIds(Convert.toStrArray(ids));
    }

    /**
     * 删除商品分类信息
     * 
     * @param id 商品分类主键
     * @return 结果
     */
    @Override
    public int deleteProductCategoryById(Long id)
    {
        return productCategoryMapper.deleteProductCategoryById(id);
    }
}
