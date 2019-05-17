package br.com.tchunaifashion.persistence.dao;

import br.com.tchunaifashion.model.Pedido;
import br.com.tchunaifashion.persistence.fabrica.ConnectionFactory;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;
import java.util.logging.Level;
import java.util.logging.Logger;

/**
 *
 * @author Matheus Correia
 */
public class PedidoDAO implements InterfacePedidoDAO{

    Connection connection;//Variável conexão com BD

    /**
     * Construtor inicializa conexão BD
     *
     */
    public PedidoDAO() {
        this.connection = new ConnectionFactory().getConnection();
    }

    
    @Override
    public void addPedido(Pedido pedido)
    {
        String sql = "INSERT INTO pedido" + "(data,cpfCli,total)" + "VALUES (?,?,?)";

        try {
            try (PreparedStatement stmt = connection.prepareStatement(sql)) {
                stmt.setDate(1, pedido.getData());
                stmt.setString(2, pedido.getCliente().getCpf());
                stmt.setDouble(3, pedido.getTotal());
                stmt.execute();

            }

        } catch (SQLException ex) {
            Logger.getLogger(PedidoDAO.class.getName()).log(Level.SEVERE, null, ex);
        }
    }

    @Override
    public Pedido pedMaisRecente()
    {
        String sql = "select * from pedido order by idPed desc limit 1";
        ClienteDAO clienteDAO = new ClienteDAO();
        try {
            Pedido ped = new Pedido();
            try (
                    PreparedStatement stmt = connection.prepareStatement(sql);
                    ResultSet rs = stmt.executeQuery()) {
                while (rs.next())
                {
                    ped.setIdPed(rs.getInt("idPed"));
                    ped.setData(rs.getDate("data"));
                    ped.setTotal(rs.getDouble("total"));
                    ped.setCliente(clienteDAO.buscaClienteCPF(rs.getString("cpfCli")));
                }
            }
            return ped;

        } catch (SQLException e) {
            Logger.getLogger(ProdutoDAO.class.getName()).log(Level.SEVERE, null, e);
        }
        //Produto prod2 = new Produto(2, "teste", "teste", "teste", "teste", 15, "teste", "teste", "M");
        return null;
    }

    @Override
    public List<Pedido> listaPedPorCli(String cpf)
    {
        String sql = "select * from pedido where cpfCli = '" + cpf + "'";
        ClienteDAO clienteDAO = new ClienteDAO();
        List<Pedido> listaPedido = new ArrayList<>();
        try {
            try (
                    PreparedStatement stmt = connection.prepareStatement(sql);
                    ResultSet rs = stmt.executeQuery()) {
                while (rs.next())
                {
                    Pedido ped = new Pedido();
                    ped.setIdPed(rs.getInt("idPed"));
                    ped.setData(rs.getDate("data"));
                    ped.setTotal(rs.getDouble("total"));
                    ped.setCliente(clienteDAO.buscaClienteCPF(rs.getString("cpfCli")));
                    listaPedido.add(ped);
                }
            }
            return listaPedido;

        } catch (SQLException e) {
            Logger.getLogger(ProdutoDAO.class.getName()).log(Level.SEVERE, null, e);
        }
        //Produto prod2 = new Produto(2, "teste", "teste", "teste", "teste", 15, "teste", "teste", "M");
        return null;
    }
    
    
}
