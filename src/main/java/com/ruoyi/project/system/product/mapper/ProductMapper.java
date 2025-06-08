package com.ruoyi.project.system.product.mapper;

import java.util.List;
import com.ruoyi.project.system.product.domain.Product;
import org.apache.ibatis.annotations.Param;

/**
 * 商品Mapper接口
 * 
 * @author ruoyi
 * @date 2022-03-10
 */
public interface ProductMapper 
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
     * 删除商品
     * 
     * @param id 商品主键
     * @return 结果
     */
    public int deleteProductById(String id);

    /**
     * 批量删除商品
     * 
     * @param ids 需要删除的数据主键集合
     * @return 结果
     */
    public int deleteProductByIds(String[] ids);

  List<Product> matchProductsByProductId(String id);

  int deductStock(@Param("productId") String productId,@Param("number") Long number);
}
