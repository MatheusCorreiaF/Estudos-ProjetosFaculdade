package Servlet;

import DAO.ClienteDAO;
import DTO.Cliente;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet(name = "ClienteServlet", urlPatterns = {"/ClienteServlet"})
public class ClienteServlet extends HttpServlet {

    /**
     * Processes requests for both HTTP <code>GET</code> and <code>POST</code>
     * methods.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     * @throws java.lang.ClassNotFoundException
     */
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException, ClassNotFoundException {

        boolean addPressed = request.getParameter("cadastrar") != null;
        boolean removerPressed = request.getParameter("excluir") != null;

        if (addPressed) {
            String cpf = request.getParameter("cpf");
            String nome = request.getParameter("nome");
            String telefone = request.getParameter("telefone");
            String endereco = request.getParameter("endereco");

            ClienteDAO cliDAO = new ClienteDAO();
            Cliente cli = new Cliente();

            cli.setNome(nome);
            cli.setCpf(cpf);
            cli.setTelefone(telefone);
            cli.setEndereco(endereco);

            cliDAO.add(cli);

            try (PrintWriter out = response.getWriter()) {

                out.println("<html>");
                out.println("<body>");
                out.println("Cliente " + cli.getNome() + " cadastrado com sucesso!");
                out.println("</body>");
                out.println("</html>");

            }
        }

        if (removerPressed) {
            Cliente cliente = new Cliente();
            ClienteDAO cliDAO = new ClienteDAO();

            String cpf = request.getParameter("cpf");
            cliente.setCpf(cpf);
            cliDAO.remover(cpf);

            try (PrintWriter out = response.getWriter()) {

                out.println("<html>");
                out.println("<body>");
                out.println("Cliente removido com sucesso");
                out.println("</body>");
                out.println("</html>");

            }
        }

        response.setContentType("text/html;charset=UTF-8");

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
        try {
            processRequest(request, response);
        } catch (ClassNotFoundException ex) {
            Logger.getLogger(ClienteServlet.class.getName()).log(Level.SEVERE, null, ex);
        }
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
        try {
            processRequest(request, response);
        } catch (ClassNotFoundException ex) {
            Logger.getLogger(ClienteServlet.class.getName()).log(Level.SEVERE, null, ex);
        }
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
