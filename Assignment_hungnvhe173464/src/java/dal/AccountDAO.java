/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package dal;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import model.Account;

/**
 *
 * @author Warspite
 */
public class AccountDAO {
    Connection connection = null;
    PreparedStatement preparedStatement = null;
    ResultSet resultSet = null;
    
    public Account getAccount(Account acc){
        String query = "select * \n" +
                        "from Account \n" +
                        "where username = ? and password = ?";
        try{
            
            connection = new DBContext().getConnection();
            preparedStatement = connection.prepareStatement(query);
            preparedStatement.setString(1, acc.getName());
            preparedStatement.setString(2, acc.getPassword());
            resultSet = preparedStatement.executeQuery();
            
            if(resultSet.next()){
                Account account = new Account(resultSet.getString(2),resultSet.getString(3),resultSet.getString(4),resultSet.getBoolean(5));
                return account;
            }
                
        } catch(Exception e){
            System.out.println(e);
        }
        
        return null;
    }
    
    public void AddNewAccount(Account acc) {
        String query = "INSERT INTO [dbo].[Account]\n"
                + "           ([username]\n"
                + "           ,[password]\n"
                + "           ,[email]\n"
                + "           ,[isAdmin])\n"
                + "     VALUES\n"
                + "           (?\n"
                + "           ,?\n"
                + "           ,?\n"
                + "           ,?)";
        try {

            connection = new DBContext().getConnection();
            preparedStatement = connection.prepareStatement(query);
            preparedStatement.setString(1, acc.getName());
            preparedStatement.setString(2, acc.getPassword());
            preparedStatement.setString(3, acc.getEmail());
            preparedStatement.setBoolean(4, acc.isIsAdmin());
            preparedStatement.executeUpdate();

        } catch (Exception e) {
            System.out.println(e);
        }
    }
    
}
