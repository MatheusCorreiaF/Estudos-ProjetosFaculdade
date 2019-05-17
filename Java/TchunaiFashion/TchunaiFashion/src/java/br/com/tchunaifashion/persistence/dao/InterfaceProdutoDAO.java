package br.com.tchunaifashion.persistence.dao;

import br.com.tchunaifashion.model.Produto;
import java.util.List;

/**
 *
 * @author Matheus Correia
 */
public interface InterfaceProdutoDAO
{
    public List<Produto> listarProduto();
    public Produto buscaProdporID(int idProd);
    public List<Produto> buscaProduto(String texto);
}
