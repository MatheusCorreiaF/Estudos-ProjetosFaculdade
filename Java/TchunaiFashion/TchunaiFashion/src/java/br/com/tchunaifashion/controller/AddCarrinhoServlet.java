/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package br.com.tchunaifashion.controller;

import br.com.tchunaifashion.model.Produto;
import br.com.tchunaifashion.persistence.dao.ProdutoDAO;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.ArrayList;
import java.util.List;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

/**
 *
 * @author Usuario
 */
@WebServlet(name = "AddCarrinhoServlet", urlPatterns = {"/AddCarrinhoServlet"})
public class AddCarrinhoServlet extends HttpServlet {

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
        try (PrintWriter out = response.getWriter()) {
            /* TODO output your page here. You may use following sample code. */
            /*out.println("<!DOCTYPE html>");
            out.println("<html>");
            out.println("<head>");
            out.println("<title>Servlet AddCarrinhoServlet</title>");            
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>" + tamanho + "</h1>");
            out.println("</body>");
            out.println("</html>");*/
            String tamanho = request.getParameter("tam");
            int id = Integer.parseInt(request.getParameter("id"));
            ProdutoDAO prodDAO = new ProdutoDAO();
            
            
               HttpSession sessionRecebeListaCarrinho = request.getSession();
               List<Produto> listaCarrinho2 = (List<Produto>) sessionRecebeListaCarrinho.getAttribute("listaCarrinho");
                 
            if(listaCarrinho2==null)
            {
                
            List<Produto> listaCarrinho = new ArrayList<>();
            Produto prod = prodDAO.buscaProdporID(id);
            prod.setTamanho(tamanho);
            listaCarrinho.add(prod);
            
            HttpSession sessionEnviaListaCarrinho = request.getSession();
            sessionEnviaListaCarrinho.setAttribute("listaCarrinho", listaCarrinho);
            RequestDispatcher dispatcher = request.getRequestDispatcher("carrinho.jsp");
            dispatcher.forward(request, response);
            }
            else
            {
            Produto prod = prodDAO.buscaProdporID(id);
            prod.setTamanho(tamanho);
            listaCarrinho2.add(prod);
            
            HttpSession sessionEnviaListaCarrinho = request.getSession();
            sessionEnviaListaCarrinho.setAttribute("listaCarrinho", listaCarrinho2);
            RequestDispatcher dispatcher = request.getRequestDispatcher("carrinho.jsp");
            dispatcher.forward(request, response);
            
            }
            
            
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
        processRequest(request, response);
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
        processRequest(request, response);
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
