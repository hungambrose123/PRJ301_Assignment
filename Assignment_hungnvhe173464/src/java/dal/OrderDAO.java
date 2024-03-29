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
import model.OrderDetails;

/**
 *
 * @author Warspite
 */
public class OrderDAO {
    Connection connection = null;
    PreparedStatement preparedStatement = null;
    ResultSet resultSet = null;
    
    public void insertOrder(OrderDetails od){
        String sql= "INSERT INTO [dbo].[Order_details]\n"
                + "           ([total]\n"
                + "           ,[email]\n"
                + "           ,[phoneNum]\n"
                + "           ,[customerAddress]\n"
                + "           ,[account_id])\n"
                + "     VALUES\n"
                + "           (?\n"
                + "           ,?\n"
                + "           ,?\n"
                + "           ,?\n"
                + "           ,?)";
        try{
            connection = new DBContext().getConnection();
            preparedStatement = connection.prepareStatement(sql);
            preparedStatement.setInt(1, od.getTotal());
            preparedStatement.setString(2, od.getEmail());
            preparedStatement.setInt(3, od.getPhoneNum());
            preparedStatement.setString(4, od.getCustomerAddress());
            preparedStatement.setInt(5, od.getAccountId());
            preparedStatement.executeUpdate();
        }catch(Exception e){
            System.out.println(e);
        }
    }
    
    public List<OrderDetails> getAllOrder(){
        List<OrderDetails> list = new ArrayList<>();
        String sql="SELECT [id]\n"
                + "      ,[total]\n"
                + "      ,[email]\n"
                + "      ,[phoneNum]\n"
                + "      ,[customerAddress]\n"
                + "      ,[account_id]\n"
                + "  FROM [VanPhongPham].[dbo].[Order_details]";
        try{
            connection = new DBContext().getConnection();
            preparedStatement = connection.prepareStatement(sql);
            resultSet = preparedStatement.executeQuery();
            
            while(resultSet.next()){
                OrderDetails od = new OrderDetails(
                                                    resultSet.getInt(2),
                                                    resultSet.getString(3),
                                                    resultSet.getInt(4),
                                                    resultSet.getString(5),
                                                    resultSet.getInt(6));
                list.add(od);
            }
            
            return list;
            
        }catch(Exception e){
            System.out.println(e);
        }
        return null;
        
    }
    
    public void deleteOrderByTotal(int total) {
        String query = "DELETE FROM [dbo].[Order_details]\n"
                + "      WHERE total = ?";
        try {
            connection = new DBContext().getConnection();
            preparedStatement = connection.prepareStatement(query);
            preparedStatement.setInt(1, total);
            preparedStatement.executeUpdate();

        } catch (Exception e) {
            System.out.println(e);
        }
    }

    public void editOrder(String totalToget, String total, String email, String phoneNum, String customerAddress, String accId) {
        String query = "UPDATE [dbo].[Order_details]\n"
                + "   SET [total] = ?\n"
                + "      ,[email] = ?\n"
                + "      ,[phoneNum] = ?\n"
                + "      ,[customerAddress] = ?\n"
                + "      ,[account_id] = ?\n"
                + " WHERE total = ?";
        try {
            connection = new DBContext().getConnection();
            preparedStatement = connection.prepareStatement(query);
            preparedStatement.setString(1, total);
            preparedStatement.setString(2, email);
            preparedStatement.setString(3, phoneNum);
            preparedStatement.setString(4, customerAddress);
            preparedStatement.setString(5, accId);
            preparedStatement.setString(6, totalToget);
            preparedStatement.executeUpdate();

        } catch (Exception e) {
            System.out.println(e);
        }
    }

}
