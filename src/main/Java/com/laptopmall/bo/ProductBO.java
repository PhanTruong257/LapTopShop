package com.laptopmall.bo;

import com.laptopmall.bean.Product;
import com.laptopmall.dao.ProductDAO;
import com.laptopmall.page.PageInfo;
import com.laptopmall.page.QueryObject;

import java.util.List;

public class ProductBO {
    ProductDAO productDAO = new ProductDAO();
    public Product getProductById(Integer id) {
        return productDAO.getProductById(id);
    }
    public boolean deleteProductById(Integer id) {
        return productDAO.deleteProductById(id);
    }
    public boolean insertProduct(Product product) {
        return productDAO.insertProduct(product);
    }
    public boolean updateProduct(Product newProduct) {
        return productDAO.updateProduct(newProduct);
    }
    public PageInfo<Product> listProducts(QueryObject qo) {
        return productDAO.listProducts(qo);
    }
    public int getProductCount(QueryObject qo) {
        return productDAO.getProductCount(qo);
    }
    public List<Product> listProducts() {
        return productDAO.listProducts();
    }
}
