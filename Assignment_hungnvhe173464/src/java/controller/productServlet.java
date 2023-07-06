/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package controller;

import dal.ProductDAO;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.List;
import model.Product;
import model.ProductCategory;

/**
 *
 * @author Warspite
 */
public class productServlet extends HttpServlet {

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
            ProductDAO productDAO = new ProductDAO();
            List<Product> productList = productDAO.getAllProduct();
            List<ProductCategory> productCategory = productDAO.getProductCategory();
            
            request.setAttribute("productList", productList);
            request.setAttribute("productCategory", productCategory);
            request.getRequestDispatcher("home.jsp").forward(request, response);
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
        ProductDAO productDAO = new ProductDAO();
        List<Product> allProduct = productDAO.getAllProduct();
        List<ProductCategory> productCategory = productDAO.getProductCategory();
        
        int productListSize = allProduct.size();
        
        int productsPerPage = 8;
        int numberOfPage = (productListSize%productsPerPage==0)
                            ?(productListSize/productsPerPage)  // if page is even
                            :((productListSize/productsPerPage) + 1); // if page is odd
        int currentPage = 0;
        String nPage = request.getParameter("currentPage");
        
        if(nPage == null){
            currentPage = 1;
        }else{
            currentPage = Integer.parseInt(nPage);
        }
        
        int start = (currentPage-1)*productsPerPage; 
        int end = Math.min(currentPage*productsPerPage, productListSize);
        // new productList for specific page
        List<Product> newProductList = productDAO.getProductPerPage(allProduct, start, end);

        request.setAttribute("productList", newProductList);
        request.setAttribute("numberOfPage", numberOfPage);
        request.setAttribute("currentPage", currentPage);
        request.setAttribute("productCategory", productCategory);
        request.getRequestDispatcher("home.jsp").forward(request, response);
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
        processRequest(request,response);
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
