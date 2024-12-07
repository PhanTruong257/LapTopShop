package com.laptopmall.servlet.product;

import java.io.File;
import java.io.IOException;
import java.math.BigDecimal;
import java.util.Arrays;
import java.util.Iterator;
import java.util.UUID;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.laptopmall.bo.ProductBO;
import org.apache.commons.fileupload.FileItem;
import org.apache.commons.fileupload.FileItemFactory;
import org.apache.commons.fileupload.disk.DiskFileItemFactory;
import org.apache.commons.fileupload.servlet.ServletFileUpload;
import org.apache.commons.io.FilenameUtils;

import com.laptopmall.bean.Product;
import com.laptopmall.dao.ProductDAO;

@WebServlet("/save_product")
public class SaveProductServlet extends HttpServlet {

    private static final long serialVersionUID = 1L;

    private static String LOAI_ANH_CHO_PHEP = new String("png;PNG;jpg;JPG;jpeg;JPEG");
    private ProductBO productBO;

    @Override
    public void init() throws ServletException {
        productBO = new ProductBO();
    }

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        req.setCharacterEncoding("utf-8");
        FileItemFactory factory = new DiskFileItemFactory();
        ServletFileUpload upload = new ServletFileUpload(factory);
        Product product = new Product();

        try {
            Iterator<FileItem> iterator = upload.parseRequest(req).iterator();
            while (iterator.hasNext()) {
                FileItem item = iterator.next();
                if (!item.isFormField()) {

                    if (item.getName() == null || "".equals(item.getName())) {

                        product.setImage(productBO.getProductById(product.getId()).getImage());
                    } else {

                        String tenMoRong = FilenameUtils.getExtension(item.getName());
                        if (!Arrays.asList(LOAI_ANH_CHO_PHEP.split(";")).contains(tenMoRong)) {
                            // Định dạng ảnh không đúng, quay lại trang chỉnh sửa và hiển thị thông báo
                            req.setAttribute("info", "Vui lòng tải lên định dạng ảnh đúng!");
                            String str = product.getId() == null ? "" : "?id=" + product.getId();
                            req.getRequestDispatcher("edit_product" + str).forward(req, resp);
                            return;
                        }
                        String tenLuuTru = UUID.randomUUID().toString() + "." + tenMoRong;
                        // Lưu tên file
                        product.setImage(tenLuuTru);
                        String thuMucLuuTru = req.getServletContext().getRealPath("/images");
                        item.write(new File(thuMucLuuTru, tenLuuTru));
                    }
                } else {
                    // Xử lý các trường khác
                    if (item.getFieldName().equals("product_id")) { // ID sản phẩm
                        String idStr = item.getString("utf-8");
                        if (idStr != null && !"".equals(idStr)) {
                            product.setId(Integer.parseInt(item.getString("utf-8")));
                        }
                    } else if (item.getFieldName().equals("product_name")) { // Tên sản phẩm
                        product.setName(item.getString("utf-8"));
                    } else if (item.getFieldName().equals("brand_id")) { // ID thương hiệu
                        product.setBrandId(Integer.parseInt(item.getString("utf-8")));
                    } else if (item.getFieldName().equals("detail")) { // Mô tả
                        product.setDetail(item.getString("utf-8"));
                    } else if (item.getFieldName().equals("stock")) { // Tồn kho
                        product.setStock(Integer.parseInt(item.getString("utf-8")));
                    } else if (item.getFieldName().equals("price")) { // Giá
                        product.setPrice(new BigDecimal(item.getString("utf-8")));
                    }
                }
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        if (product.getId() == null) {
            // Thêm mới sản phẩm
            productBO.insertProduct(product);
            req.setAttribute("info", "Thêm sản phẩm mới thành công");
        } else {
            // Cập nhật sản phẩm
            productBO.updateProduct(product);
            req.setAttribute("info", "Cập nhật sản phẩm thành công");
        }
        String str = product.getId() == null ? "" : "?id=" + product.getId();
        req.getRequestDispatcher("edit_product" + str).forward(req, resp);
    }

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        doPost(req, resp);
    }
}
