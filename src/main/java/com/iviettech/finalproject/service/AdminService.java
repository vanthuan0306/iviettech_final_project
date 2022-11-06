package com.iviettech.finalproject.service;

import com.iviettech.finalproject.entity.ProductDetailEntity;
import com.iviettech.finalproject.entity.ProductEntity;
import com.iviettech.finalproject.entity.ProductImageEntity;
import com.iviettech.finalproject.helper.CSVHelper;
import com.iviettech.finalproject.helper.ProductDetailRawExport;
import com.iviettech.finalproject.helper.ProductRawExport;
import com.iviettech.finalproject.repository.*;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartFile;
import org.supercsv.io.CsvBeanWriter;
import org.supercsv.io.ICsvBeanWriter;
import org.supercsv.prefs.CsvPreference;

import javax.servlet.ServletContext;
import javax.servlet.http.HttpServletResponse;
import java.io.BufferedOutputStream;
import java.io.File;
import java.io.FileOutputStream;
import java.io.IOException;
import java.text.DateFormat;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;
import java.util.Optional;

@Service
public class AdminService {
    @Autowired
    ProductRepository productRepository;

    @Autowired
    ProductImageRepository productImageRepository;

    @Autowired
    ProductDetailRepository productDetailRepository;

    @Autowired
    CategoryRepository categoryRepository;

    @Autowired
    CategoryDetailRepository categoryDetailRepository;

    @Autowired
    ManufactorRepository manufactorRepository;

    @Autowired
    OrderRepository orderRepository;

    @Autowired
    OrderDetailRepository orderDetailRepository;

    @Autowired
    ServletContext servletContext;


    public void uploadFile(MultipartFile file,int id) {
        if( null != file && !file.isEmpty()){
            try {
                byte[] bytes = file.getBytes();
//                String path = "D:\\final\\iviettech_final_project\\src\\main\\webapp\\resources\\images\\products\\";
                String path = servletContext.getRealPath("/resources/images/product/");
                String name = file.getOriginalFilename();
                File dir = new File(path);
                if (!dir.exists()) {
                    dir.mkdirs();
                }

//                String name = String.valueOf(new Date().getTime()+".jpg");
                String source = "/resources/images/product/" + name;
                // Create the file on server
                String fileSource = path + File.separator + file.getOriginalFilename();
                File serverFile = new File(fileSource);
                System.out.println("=====Path image to server: " + serverFile.getPath());
                BufferedOutputStream stream = new BufferedOutputStream(new FileOutputStream(serverFile));
                stream.write(bytes);
                stream.close();
                ProductImageEntity imageEntity = new ProductImageEntity();
                Optional<ProductEntity> productEntity = productRepository.findById(id);
                imageEntity.setProduct(productEntity.get());
                imageEntity.setImageUrl(source);
                imageEntity.setImageAlt(name);
                productImageRepository.save(imageEntity);


            } catch (IOException e) {
                System.out.println("====== Error upload file:" + e.getMessage());
            }

        } else {
            System.out.println("====== File not exists");
        }

    }


    public void saveProduct(MultipartFile file) {
        try {
            List<ProductEntity> productEntityList = CSVHelper.readProductData(file.getInputStream());

            productRepository.saveAll(productEntityList);
        } catch (IOException e) {
            e.printStackTrace();
        }
    }

    public void exportProduct(HttpServletResponse response) throws IOException {
        response.setContentType("text/csv");
        DateFormat dateFormatter = new SimpleDateFormat("yyyy-MM-dd_HH-mm-ss");
        String currentDateTime = dateFormatter.format(new Date());

        String headerKey = "Content-Disposition";
        String headerValue = "attachment; filename=Product_" + currentDateTime + ".csv";
        response.setHeader(headerKey, headerValue);

        List<ProductEntity> productEntityList = (List<ProductEntity>) productRepository.findAll();

        ICsvBeanWriter csvWriter = new CsvBeanWriter(response.getWriter(), CsvPreference.STANDARD_PREFERENCE);
        String[] csvHeader = { "ID", "Name", "Category_Detail_ID", "Orginal_Price", "Actual_Price", "Manufactor_ID", "Add_Date", "Status", "Description", "Infor" };
        String[] nameMapping = { "id", "name", "category_detail_id", "original_price", "actual_price", "manufactor_id", "add_date", "status", "description", "addition_info"};

        csvWriter.writeHeader(csvHeader);

        for (ProductEntity productEntity : productEntityList) {
            try {
//                BookRawExport data = new BookRawExport(bookEntity);
                ProductRawExport data = new ProductRawExport(productEntity);
                csvWriter.write(data, nameMapping);
            } catch (Exception e) {
                System.out.println("Skip this record/data");
                continue;
            }
        }

        csvWriter.close();
    }

    //---------------------ProductDetail

    public void exportProductDetail(HttpServletResponse response) throws IOException {
        response.setContentType("text/csv");
        DateFormat dateFormatter = new SimpleDateFormat("yyyy-MM-dd_HH-mm-ss");
        String currentDateTime = dateFormatter.format(new Date());

        String headerKey = "Content-Disposition";
        String headerValue = "attachment; filename=ProductDetail_" + currentDateTime + ".csv";
        response.setHeader(headerKey, headerValue);

        List<ProductDetailEntity> productDetailEntityList =
                (List<ProductDetailEntity>) productDetailRepository.findAll();

        ICsvBeanWriter csvWriter = new CsvBeanWriter(response.getWriter(), CsvPreference.STANDARD_PREFERENCE);
        String[] csvHeader = { "ID", "Color", "Quantity", "Size", "Product_ID" };
        String[] nameMapping = { "id", "color", "quantity", "size", "product_id" };

        csvWriter.writeHeader(csvHeader);

        for (ProductDetailEntity productDetailEntity : productDetailEntityList) {
            try {
//                BookRawExport data = new BookRawExport(bookEntity);
                ProductDetailRawExport data = new ProductDetailRawExport(productDetailEntity);
                csvWriter.write(data, nameMapping);
            } catch (Exception e) {
                System.out.println("Skip this record/data");
                continue;
            }
        }

        csvWriter.close();
    }

//    public void saveProductDetail(MultipartFile file) {
//        try {
//            List<ProductDetailEntity> productDetailEntityListEntityList = CSVHelper.readProductData(file.getInputStream());
//
//            productRepository.saveAll(productEntityList);
//        } catch (IOException e) {
//            e.printStackTrace();
//        }
//    }


}
