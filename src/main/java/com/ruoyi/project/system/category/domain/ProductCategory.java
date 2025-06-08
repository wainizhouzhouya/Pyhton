package com.ruoyi.project.system.category.domain;

import org.apache.commons.lang3.builder.ToStringBuilder;
import org.apache.commons.lang3.builder.ToStringStyle;
import com.ruoyi.framework.aspectj.lang.annotation.Excel;
import com.ruoyi.framework.web.domain.BaseEntity;

/**
 * 商品分类对象 product_category
 * 
 * @author ruoyi
 * @date 2022-03-10
 */
public class ProductCategory extends BaseEntity
{
    private static final long serialVersionUID = 1L;

    /** 商品分类编号 */
    private Long id;

    /** 商品分类名称 */
    @Excel(name = "商品分类名称")
    private String name;

    public void setId(Long id)
    {
        this.id = id;
    }

    public Long getId()
    {
        return id;
    }
    public void setName(String name)
    {
        this.name = name;
    }

    public String getName()
    {
        return name;
    }

    @Override
    public String toString() {
        return new ToStringBuilder(this,ToStringStyle.MULTI_LINE_STYLE)
            .append("id", getId())
            .append("name", getName())
            .toString();
    }
}
