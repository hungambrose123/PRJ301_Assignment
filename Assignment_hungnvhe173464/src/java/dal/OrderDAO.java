/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package dal;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
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

}
