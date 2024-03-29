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
import model.Account;

/**
 *
 * @author Warspite
 */
public class AccountDAO {
    Connection connection = null;
    PreparedStatement preparedStatement = null;
    ResultSet resultSet = null;
    
    public List<Account> getAllAccount(){
        List<Account> list = new ArrayList<>();
        String sql = "SELECT \n"
                + "      [username]\n"
                + "      ,[password]\n"
                + "      ,[email]\n"
                + "      ,[isAdmin]\n"
                + "  FROM [VanPhongPham].[dbo].[Account]";
        try{
            connection = new DBContext().getConnection();
            preparedStatement = connection.prepareStatement(sql);
            resultSet = preparedStatement.executeQuery();
            
            while(resultSet.next()){
                Account acc = new Account(resultSet.getString(1),resultSet.getString(2),resultSet.getString(3),resultSet.getBoolean(4));
                list.add(acc);
            }
            return list;
        }catch(Exception e){
            System.out.println(e);
        }
        
        return null;
    }
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
    
    public int getAccountIdByName(String name) {
        String query = "SELECT [id]\n"
                + "  FROM [dbo].[Account]\n"
                + "  where username = ?";
        try {

            connection = new DBContext().getConnection();
            preparedStatement = connection.prepareStatement(query);
            preparedStatement.setString(1, name);
            resultSet = preparedStatement.executeQuery();
            
            while(resultSet.next()){
                return resultSet.getInt(1);
            }

        } catch (Exception e) {
            System.out.println(e);
        }
        return 0;
    }
    
}
