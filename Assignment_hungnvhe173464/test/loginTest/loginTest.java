/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package loginTest;

import dal.AccountDAO;

/**
 *
 * @author Warspite
 */
public class loginTest {
    public static void main(String[] args) {
        AccountDAO c = new AccountDAO();
        boolean check = c.checkLogin("hungnvhe173464", "123");
        System.out.println(check);
    }
}
