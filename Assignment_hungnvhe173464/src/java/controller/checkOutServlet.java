/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package controller;

import dal.AccountDAO;
import dal.OrderDAO;
import dal.ProductDAO;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.HashMap;
import java.util.Random;
import model.Account;
import model.Item;
import model.OrderDetails;

/**
 *
 * @author Warspite
 */
public class checkOutServlet extends HttpServlet {

    /**
     * Processes requests for both HTTP <code>GET</code> and <code>POST</code>
     * methods.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        try ( PrintWriter out = response.getWriter()) {
            /* TODO output your page here. You may use following sample code. */
            out.println("<!DOCTYPE html>");
            out.println("<html>");
            out.println("<head>");
            out.println("<title>Servlet checkOutServlet</title>");            
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet checkOutServlet at " + request.getContextPath() + "</h1>");
            out.println("</body>");
            out.println("</html>");
        }
    }

    // <editor-fold defaultstate="collapsed" desc="HttpServlet methods. Click on the + sign on the left to edit the code.">
    /**
     * Handles the HTTP <code>GET</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        HttpSession session = request.getSession();
        
        String username = (String) session.getAttribute("user");
     //   String email = (String) session.getAttribute("email");
        String address = request.getParameter("address");
        String phoneNumber = request.getParameter("phoneNumber");
        HashMap<Integer, Item> cart = (HashMap<Integer, Item>) session.getAttribute("cart");
        
        session.setAttribute("cart", cart);
        request.setAttribute("username", username);
     //   request.setAttribute("email", email);
        request.setAttribute("address", address);
        request.setAttribute("phoneNumber", phoneNumber);
        request.getRequestDispatcher("/userView/checkout.jsp").forward(request, response);
        
    }

    /**
     * Handles the HTTP <code>POST</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
         HttpSession session = request.getSession();
         AccountDAO accDAO = new AccountDAO();
         OrderDAO orderDAO = new OrderDAO();
         
         
         int number = Integer.parseInt(request.getParameter("number"));
         String address = request.getParameter("address");
         
         int totalMoney = Integer.parseInt(request.getParameter("totalMoney"));
         Account account = (Account) session.getAttribute("account");
         int accountId = accDAO.getAccountIdByName(account.getName());
         String email = account.getEmail();
         
         //insert into database
         OrderDetails od = new OrderDetails(totalMoney,email,number,address,accountId);
         orderDAO.insertOrder(od);
  

         request.setAttribute("message", "Order successful! We will contact you soon");
         request.getRequestDispatcher("/userView/checkout.jsp").forward(request, response);
    }

    /**
     * Returns a short description of the servlet.
     *
     * @return a String containing servlet description
     */
    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

}
