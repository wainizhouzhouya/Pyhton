package com.ruoyi.project.system.product.domain;

import java.math.BigDecimal;
import org.apache.commons.lang3.builder.ToStringBuilder;
import org.apache.commons.lang3.builder.ToStringStyle;
import com.ruoyi.framework.aspectj.lang.annotation.Excel;
import com.ruoyi.framework.web.domain.BaseEntity;

/**
 * 商品对象 product
 * 
 * @author ruoyi
 * @date 2022-03-10
 */
public class Product extends BaseEntity
{
    private static final long serialVersionUID = 1L;

    /** 条形码 */
    private String id;

    /** 商品分类编号 */
    @Excel(name = "商品分类编号")
    private Long categoryId;
    private String categoryName;

    /** 供应商编号 */
    @Excel(name = "供应商编号")
    private Long providerId;
    private String providerName;

    /** 商品名称 */
    @Excel(name = "商品名称")
    private String name;

    /** 生产地址 */
    @Excel(name = "生产地址")
    private String factoryAddress;

    /** 进货价 */
    @Excel(name = "进货价")
    private BigDecimal purchasePrice;

    /** 销售价 */
    @Excel(name = "销售价")
    private BigDecimal salePrice;

    /** 库存 */
    @Excel(name = "库存")
    private Long stock;

    public String getCategoryName() {
        return categoryName;
    }

    public void setCategoryName(String categoryName) {
        this.categoryName = categoryName;
    }

    public String getProviderName() {
        return providerName;
    }

    public void setProviderName(String providerName) {
        this.providerName = providerName;
    }

    public void setId(String id)
    {
        this.id = id;
    }

    public String getId()
    {
        return id;
    }
    public void setCategoryId(Long categoryId)
    {
        this.categoryId = categoryId;
    }

    public Long getCategoryId()
    {
        return categoryId;
    }
    public void setProviderId(Long providerId)
    {
        this.providerId = providerId;
    }

    public Long getProviderId()
    {
        return providerId;
    }
    public void setName(String name)
    {
        this.name = name;
    }

    public String getName()
    {
        return name;
    }
    public void setFactoryAddress(String factoryAddress)
    {
        this.factoryAddress = factoryAddress;
    }

    public String getFactoryAddress()
    {
        return factoryAddress;
    }
    public void setPurchasePrice(BigDecimal purchasePrice)
    {
        this.purchasePrice = purchasePrice;
    }

    public BigDecimal getPurchasePrice()
    {
        return purchasePrice;
    }
    public void setSalePrice(BigDecimal salePrice)
    {
        this.salePrice = salePrice;
    }

    public BigDecimal getSalePrice()
    {
        return salePrice;
    }
    public void setStock(Long stock)
    {
        this.stock = stock;
    }

    public Long getStock()
    {
        return stock;
    }

    @Override
    public String toString() {
        return new ToStringBuilder(this,ToStringStyle.MULTI_LINE_STYLE)
            .append("id", getId())
            .append("categoryId", getCategoryId())
            .append("providerId", getProviderId())
            .append("name", getName())
            .append("factoryAddress", getFactoryAddress())
            .append("purchasePrice", getPurchasePrice())
            .append("salePrice", getSalePrice())
            .append("stock", getStock())
            .toString();
    }
}
