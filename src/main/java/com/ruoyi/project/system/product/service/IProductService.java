package com.ruoyi.project.system.product.service;

import java.util.List;
import com.ruoyi.project.system.product.domain.Product;

/**
 * 商品Service接口
 * 
 * @author ruoyi
 * @date 2022-03-10
 */
public interface IProductService 
{
    /**
     * 查询商品
     * 
     * @param id 商品主键
     * @return 商品
     */
    public Product selectProductById(String id);

    /**
     * 查询商品列表
     * 
     * @param product 商品
     * @return 商品集合
     */
    public List<Product> selectProductList(Product product);

    /**
     * 新增商品
     * 
     * @param product 商品
     * @return 结果
     */
    public int insertProduct(Product product);

    /**
     * 修改商品
     * 
     * @param product 商品
     * @return 结果
     */
    public int updateProduct(Product product);

    /**
     * 批量删除商品
     * 
     * @param ids 需要删除的商品主键集合
     * @return 结果
     */
    public int deleteProductByIds(String ids);

    /**
     * 删除商品信息
     * 
     * @param id 商品主键
     * @return 结果
     */
    public int deleteProductById(String id);

  List<Product> matchProductsByProductId(String id);

  int deductStock(String productId, Long number);
}
