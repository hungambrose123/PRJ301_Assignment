/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package dal;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;
import model.Product;
import model.ProductCategory;

/**
 *
 * @author Warspite
 */
public class ProductDAO {
    Connection connection = null;
    PreparedStatement preparedStatement = null;
    ResultSet resultSet = null;
    
    public List<Product> getAllProduct(){
        List<Product> product = new ArrayList<>();
        String query = "SELECT [id]\n"
                + "      ,[name]\n"
                + "      ,[price]\n"
                + "      ,[image]\n"
                + "      ,[description]\n"
                + "      ,[category_id]\n"
                + "  FROM [VanPhongPham].[dbo].[Product]";
        try{
            connection = new DBContext().getConnection();
            preparedStatement = connection.prepareStatement(query);
            resultSet = preparedStatement.executeQuery();
            
            while(resultSet.next()){
                Product newProduct = new Product(resultSet.getInt(1),
                        resultSet.getString(2),
                        resultSet.getInt(3),
                        resultSet.getString(4),
                        resultSet.getString(5),
                        resultSet.getInt(6));
                product.add(newProduct);
            }
            
            
        }catch(Exception e){
            System.out.println(e);
        }
        
        return product;
    }
    
    public List<ProductCategory> getProductCategory(){
        List<ProductCategory> productCategory = new ArrayList<>();
        String query = "select * from Product_category";
        try{
            connection = new DBContext().getConnection();
            preparedStatement = connection.prepareStatement(query);
            resultSet = preparedStatement.executeQuery();
            
            while(resultSet.next()){
                ProductCategory category = new ProductCategory(resultSet.getInt(1),
                                                           resultSet.getString(2));
                productCategory.add(category);
            }
            
        }catch(Exception e){
            System.out.println(e);
        }
        
        return productCategory;
    }
            
}
