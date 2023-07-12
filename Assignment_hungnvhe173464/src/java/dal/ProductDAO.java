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
    
    public List<Product> getProductPerPage(List<Product> productList, int start, int end){
        List<Product> newProductList = new ArrayList<>();
        for(int i=start; i<end; i++){
            newProductList.add(productList.get(i));
        }
        
        return newProductList;
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
    
    public List<Product> getProductByCategory(String categoryName){
        List<Product> productByCategory = new ArrayList<>();
        String query = "select * \n" +
                       "from Product p, Product_category pc\n" +
                       "where p.category_id = pc.id and pc.name = ?";
        try {
            connection = new DBContext().getConnection();
            preparedStatement = connection.prepareStatement(query);
            preparedStatement.setString(1, categoryName);
            resultSet = preparedStatement.executeQuery();

            while (resultSet.next()) {
                Product productList = new Product(resultSet.getInt(1),
                        resultSet.getString(2),
                        resultSet.getInt(3),
                        resultSet.getString(4),
                        resultSet.getString(5),
                        resultSet.getInt(6));
                productByCategory.add(productList);
            }

        } catch (Exception e) {
            System.out.println(e);
        }

        return productByCategory;
    }
    
    public List<Product> getProductByName(String name){
        List<Product> productByName= new ArrayList<>();
        String query = "select*\n"
                + "from Product p \n"
                + "where p.name like ?";
        try {
            connection = new DBContext().getConnection();
            preparedStatement = connection.prepareStatement(query);
            preparedStatement.setString(1, "%"+name+"%");
            resultSet = preparedStatement.executeQuery();

            while (resultSet.next()) {
                Product productList = new Product(resultSet.getInt(1),
                        resultSet.getString(2),
                        resultSet.getInt(3),
                        resultSet.getString(4),
                        resultSet.getString(5),
                        resultSet.getInt(6));
                productByName.add(productList);
            }

        } catch (Exception e) {
            System.out.println(e);
        }
        
        return productByName;
    }
    
    public Product getProductByID(int id) {
        String query = "select *\n"
                + "from Product p\n"
                + "where p.id = ?";
        try {
            connection = new DBContext().getConnection();
            preparedStatement = connection.prepareStatement(query);
            preparedStatement.setInt(1, id);
            resultSet = preparedStatement.executeQuery();

            while (resultSet.next()) {
                Product product = new Product(resultSet.getInt(1),
                        resultSet.getString(2),
                        resultSet.getInt(3),
                        resultSet.getString(4),
                        resultSet.getString(5),
                        resultSet.getInt(6));
                return product;
            }

        } catch (Exception e) {
            System.out.println(e);
        }

        return null;
    }
    
    public void deleteProductById(int id){
        String query = "delete \n"
                + "from Product \n"
                + "where id = ?";
        try {
            connection = new DBContext().getConnection();
            preparedStatement = connection.prepareStatement(query);
            preparedStatement.setInt(1, id);
            preparedStatement.executeUpdate();

        } catch (Exception e) {
            System.out.println(e);
        }
    }
    
    public void editProductById(int id, String name, int price,String image,String description,int categoryID){
        String query = "UPDATE [dbo].[Product]\n"
                + "   SET [name] = ?\n"
                + "      ,[price] = ?\n"
                + "      ,[image] = ?\n"
                + "      ,[description] = ?\n"
                + "      ,[category_id] = ?\n"
                + " WHERE id = ?";
        try {
            connection = new DBContext().getConnection();
            preparedStatement = connection.prepareStatement(query);
            preparedStatement.setString(1, name);
            preparedStatement.setInt(2, price);
            preparedStatement.setString(3, image);
            preparedStatement.setString(4, description);
            preparedStatement.setInt(5, categoryID);
            preparedStatement.setInt(6, id);
            preparedStatement.executeUpdate();

        } catch (Exception e) {
            System.out.println(e);
        }
    }
    
    public void addProduct(String name, int price,String image,String description,int categoryID){
        String query = "insert into Product(name,price,image,description,category_id)\n"
                + "values (?, ?, ?, ?, ?)";
        try {
            connection = new DBContext().getConnection();
            preparedStatement = connection.prepareStatement(query);
            preparedStatement.setString(1, name);
            preparedStatement.setInt(2, price);
            preparedStatement.setString(3, image);
            preparedStatement.setString(4, description);
            preparedStatement.setInt(5, categoryID);
            preparedStatement.executeUpdate();
 
        } catch (Exception e) {
            System.out.println(e);
        }
    }
            
}
