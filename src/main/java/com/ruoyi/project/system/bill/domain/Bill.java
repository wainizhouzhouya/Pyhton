package com.ruoyi.project.system.bill.domain;

import java.math.BigDecimal;
import org.apache.commons.lang3.builder.ToStringBuilder;
import org.apache.commons.lang3.builder.ToStringStyle;
import com.ruoyi.framework.aspectj.lang.annotation.Excel;
import com.ruoyi.framework.web.domain.BaseEntity;

/**
 * 销售账单对象 bill
 * 
 * @author ruoyi
 * @date 2022-03-11
 */
public class Bill extends BaseEntity
{
    private static final long serialVersionUID = 1L;

    /** 账单项目编号 */
    private Long id;

    /** 商品编号 */
    @Excel(name = "商品编号")
    private String productId;

    /** 商品名称 */
    @Excel(name = "商品名称")
    private String productName;

    /** 分类编号 */
    @Excel(name = "分类编号")
    private Long categoryId;

    /** 所属分类 */
    @Excel(name = "所属分类")
    private String categoryName;

    /** 进货价 */
    @Excel(name = "进货价")
    private BigDecimal purchasePrice;

    /** 销售价 */
    @Excel(name = "销售价")
    private BigDecimal salePrice;

    /** 净利润 */
    @Excel(name = "净利润")
    private BigDecimal profits;

    /** 购买数量 */
    @Excel(name = "购买数量")
    private Long number;

    public void setId(Long id)
    {
        this.id = id;
    }

    public Long getId()
    {
        return id;
    }
    public void setProductId(String productId)
    {
        this.productId = productId;
    }

    public String getProductId()
    {
        return productId;
    }
    public void setProductName(String productName)
    {
        this.productName = productName;
    }

    public String getProductName()
    {
        return productName;
    }
    public void setCategoryId(Long categoryId)
    {
        this.categoryId = categoryId;
    }

    public Long getCategoryId()
    {
        return categoryId;
    }
    public void setCategoryName(String categoryName)
    {
        this.categoryName = categoryName;
    }

    public String getCategoryName()
    {
        return categoryName;
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
    public void setProfits(BigDecimal profits)
    {
        this.profits = profits;
    }

    public BigDecimal getProfits()
    {
        return profits;
    }
    public void setNumber(Long number)
    {
        this.number = number;
    }

    public Long getNumber()
    {
        return number;
    }

    @Override
    public String toString() {
        return new ToStringBuilder(this,ToStringStyle.MULTI_LINE_STYLE)
            .append("id", getId())
            .append("productId", getProductId())
            .append("productName", getProductName())
            .append("categoryId", getCategoryId())
            .append("categoryName", getCategoryName())
            .append("purchasePrice", getPurchasePrice())
            .append("salePrice", getSalePrice())
            .append("profits", getProfits())
            .append("number", getNumber())
            .append("createTime", getCreateTime())
            .toString();
    }
}
