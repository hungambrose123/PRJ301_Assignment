/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package common_functions;

/**
 *
 * @author Warspite
 */
import java.io.*;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

/**
 *
 * @author Warspite
 */
public class sqServlet extends HttpServlet{
    @Override
    public void service(HttpServletRequest req, HttpServletResponse res) throws IOException{
        PrintWriter out = res.getWriter();
        String answer = (String) req.getAttribute("value");
        out.println("Hello this is sq !");
        out.println("A servlet inside servlet !");
        out.println("The answer is: "+ answer);
    }
}
