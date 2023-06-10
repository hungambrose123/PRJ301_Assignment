/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package dbTest;

import dal.ProductDAO;
import java.util.List;
import model.Product;

/**
 *
 * @author Warspite
 */
public class productTest {
        
    public static void main(String[] args){
        ProductDAO productDAO = new ProductDAO();
        List<Product> test =  productDAO.getAllProduct();
        
        System.out.println(test);
    }
}
