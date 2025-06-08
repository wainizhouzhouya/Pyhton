package com.ruoyi.project.system.product.service.impl;

import java.util.List;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import com.ruoyi.project.system.product.mapper.ProductMapper;
import com.ruoyi.project.system.product.domain.Product;
import com.ruoyi.project.system.product.service.IProductService;
import com.ruoyi.common.utils.text.Convert;

/**
 * 商品Service业务层处理
 * 
 * @author ruoyi
 * @date 2022-03-10
 */
@Service
public class ProductServiceImpl implements IProductService 
{
    @Autowired
    private ProductMapper productMapper;

    /**
     * 查询商品
     * 
     * @param id 商品主键
     * @return 商品
     */
    @Override
    public Product selectProductById(String id)
    {
        return productMapper.selectProductById(id);
    }

    /**
     * 查询商品列表
     * 
     * @param product 商品
     * @return 商品
     */
    @Override
    public List<Product> selectProductList(Product product)
    {
        return productMapper.selectProductList(product);
    }

    /**
     * 新增商品
     * 
     * @param product 商品
     * @return 结果
     */
    @Override
    public int insertProduct(Product product)
    {
        return productMapper.insertProduct(product);
    }

    /**
     * 修改商品
     * 
     * @param product 商品
     * @return 结果
     */
    @Override
    public int updateProduct(Product product)
    {
        return productMapper.updateProduct(product);
    }

    /**
     * 批量删除商品
     * 
     * @param ids 需要删除的商品主键
     * @return 结果
     */
    @Override
    public int deleteProductByIds(String ids)
    {
        return productMapper.deleteProductByIds(Convert.toStrArray(ids));
    }

    /**
     * 删除商品信息
     * 
     * @param id 商品主键
     * @return 结果
     */
    @Override
    public int deleteProductById(String id)
    {
        return productMapper.deleteProductById(id);
    }

  @Override
  public List<Product> matchProductsByProductId(String id) {
    return productMapper.matchProductsByProductId(id);
  }

  @Override
  public int deductStock(String productId, Long number) {
    return productMapper.deductStock(productId, number);
  }
}
