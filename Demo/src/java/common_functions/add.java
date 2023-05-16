/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package common_functions;

import jakarta.servlet.RequestDispatcher;
import jakarta.servlet.ServletException;
import java.io.*;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

/**
 *
 * @author Warspite
 */
public class add extends HttpServlet{
    @Override
    public void service(HttpServletRequest req, HttpServletResponse res) throws IOException, ServletException{
        int i = Integer.parseInt(req.getParameter("num1"));
        int j = Integer.parseInt(req.getParameter("num2"));
        int result = i + j;
        
        RequestDispatcher reqDis = req.getRequestDispatcher("sq");
        reqDis.forward(req, res);
        
    }
}
