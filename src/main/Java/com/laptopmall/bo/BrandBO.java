package com.laptopmall.bo;

import com.laptopmall.bean.Brand;
import com.laptopmall.dao.BrandDAO;

import java.util.List;

public class BrandBO {
    BrandDAO brandDAO = new BrandDAO();
    public List<Brand> listBrands() {
        return brandDAO.listBrands();
    }
    public boolean insertBrand(Brand brand) {
        return brandDAO.insertBrand(brand);
    }
    public Brand getBrandByName(String name) {
        return brandDAO.getBrandByName(name);
    }
}
