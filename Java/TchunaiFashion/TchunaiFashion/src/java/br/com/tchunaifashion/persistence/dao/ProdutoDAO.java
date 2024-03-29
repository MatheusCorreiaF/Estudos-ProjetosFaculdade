package br.com.tchunaifashion.persistence.dao;

import br.com.tchunaifashion.model.Produto;
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
public class ProdutoDAO implements InterfaceProdutoDAO {

    Connection connection;//Variável conexão com BD

    /**
     * Construtor inicializa conexão BD
     *
     */
    public ProdutoDAO() {
        this.connection = new ConnectionFactory().getConnection();
    }

    @Override
    public List<Produto> listarProduto() {
        String sql = "SELECT * FROM produto";

        try {
            List<Produto> listaProduto = new ArrayList<>();
            try (
                    PreparedStatement stmt = connection.prepareStatement(sql);
                    ResultSet rs = stmt.executeQuery()) {

                while (rs.next()) {
                    Produto prod = new Produto();
                    prod.setIdProd(rs.getInt("idProd"));
                    prod.setNomeProd(rs.getString("nomeProd"));
                    prod.setDescricao(rs.getString("descricao"));
                    prod.setImagem(rs.getString("imagem"));
                    prod.setGenero(rs.getString("genero"));
                    prod.setCor(rs.getString("cor"));
                    prod.setPreco(rs.getDouble("preco"));
                    prod.setTipo(rs.getString("tipo"));

                    listaProduto.add(prod);
                }
            }
            return listaProduto;

        } catch (SQLException e) {
            Logger.getLogger(ProdutoDAO.class.getName()).log(Level.SEVERE, null, e);
        }
        return null;
    }

    @Override
    public Produto buscaProdporID(int idProd) {
        String sql = "SELECT * FROM produto where idProd = " + idProd + ";";

        try {
            Produto prod = new Produto();
            try (
                    PreparedStatement stmt = connection.prepareStatement(sql);
                    ResultSet rs = stmt.executeQuery()) {
                while (rs.next()) {
                    prod.setIdProd(rs.getInt("idProd"));
                    prod.setNomeProd(rs.getString("nomeProd"));
                    prod.setDescricao(rs.getString("descricao"));
                    prod.setImagem(rs.getString("imagem"));
                    prod.setGenero(rs.getString("genero"));
                    prod.setCor(rs.getString("cor"));
                    prod.setPreco(rs.getDouble("preco"));
                    prod.setTipo(rs.getString("tipo"));
                }
            }
            return prod;

        } catch (SQLException e) {
            Logger.getLogger(ProdutoDAO.class.getName()).log(Level.SEVERE, null, e);
        }
        Produto prod2 = new Produto(2, "teste", "teste", "teste", "teste", 15, "teste", "teste", "M");
        return prod2;
    }

    @Override
    public List<Produto> buscaProduto(String texto)
    {
        String sql = "select * from produto " +
                     "where descricao like '%"+texto+"%'\n" +
                     "or tipo like '%"+texto+"%'\n" +
                     "or nomeProd like '%"+texto+"%'\n" +
                     "or cor like '%"+texto+"%'" +
                     "or genero like '%"+texto+"%'";
        
        try {
            List<Produto> listaProduto = new ArrayList<>();
            try (
                    PreparedStatement stmt = connection.prepareStatement(sql);
                    ResultSet rs = stmt.executeQuery()) {

                while (rs.next()) {
                    Produto prod = new Produto();
                    prod.setIdProd(rs.getInt("idProd"));
                    prod.setNomeProd(rs.getString("nomeProd"));
                    prod.setDescricao(rs.getString("descricao"));
                    prod.setImagem(rs.getString("imagem"));
                    prod.setGenero(rs.getString("genero"));
                    prod.setCor(rs.getString("cor"));
                    prod.setPreco(rs.getDouble("preco"));
                    prod.setTipo(rs.getString("tipo"));

                    listaProduto.add(prod);
                }
            }
            return listaProduto;

        } catch (SQLException e) {
            Logger.getLogger(ProdutoDAO.class.getName()).log(Level.SEVERE, null, e);
        }
        return null;
    }
}
