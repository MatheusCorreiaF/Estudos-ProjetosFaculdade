<%-- 
    Document   : produto
    Created on : 24/07/2015, 20:02:11
    Author     : Matheus Correia
--%>

<%@page import="br.com.tchunaifashion.model.Cliente"%>
<%@page import="br.com.tchunaifashion.services.UpdateTotal"%>
<%@page import="java.util.List"%>
<%@page import="br.com.tchunaifashion.model.Produto"%>
<%@page contentType="text/html" pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>

    <head>
        <meta name="viewport" content="width=device-width">
        <title>Produto da Tchunai Fashion</title>
        <link rel="stylesheet" href="tchunai_css/reset.css">
        <link rel="stylesheet" href="tchunai_css/indexcss.css">
        <link rel="stylesheet" href="tchunai_css/mobile.css" media="(max-width: 939px)">
        <link rel="stylesheet" href="tchunai_css/produtocss.css">
    </head>

    <%
        HttpSession sessionRecebeListaCarrinho = request.getSession();
        List<Produto> listaCarrinho = (List<Produto>) sessionRecebeListaCarrinho.getAttribute("listaCarrinho");
        int i = 0;
        UpdateTotal ut = new UpdateTotal();
        Cliente cliente = (Cliente) sessionRecebeListaCarrinho.getAttribute("cliente");

    %>
    <body>
        <header class="container">

            <h1><a href="index.jsp"><img class="logo" src="img/logo.png" alt="Tchunai Fashion"></a></h1>

            <div class="sacola" class="container" >
                <div style="font-weight:bold; font-family: Oxygen; font-size:12px; margin-left: 50px; margin-top: -8px;">
                    <%if (cliente == null) {%>
                    <a id="login" href="login.jsp">Login</a><br>
                    <%} else {%>
                    <a id="login" href="/TchunaiFashion/DetalhaClienteServlet"><%=cliente.getNome()%></a><br><a href="/TchunaiFashion/LogoutServlet">(Sair)<br></a>
                    <%}if (listaCarrinho == null) {%>
                    <a id="qtd-sacola" href="carrinho.jsp" title="Minha Compra">0 Produtos</a>
                    <a rel="noindex nofollow" id="val-sacola" href="carrinho.jsp" title="Minha Compra"><br>R$ 0.00</a>
                        <%} else {%>
                    <a id="qtd-sacola" href="carrinho.jsp" title="Minha Compra"><%=listaCarrinho.size()%> Produtos</a>
                    <a rel="noindex nofollow" id="val-sacola" href="carrinho.jsp" title="Minha Compra"><br>R$ <%=ut.preco(listaCarrinho)%></a> 
                        <%}%>


                </div>
            </div>

            <nav class="menu-setores">
                <ul>
                    <%if (cliente == null) {%>
                    <li><a href="login.jsp">Sua Conta</a></li>
                        <%} else {%>
                    <li><a href="detalhesconta.jsp">Sua Conta</a></li><%}%>
                    <li><a href="#">Lista de Desejos</a></li>
                    <li><a href="#">Cart�o Fidelidade</a></li>
                    <li><a href="sobre.html">Sobre</a></li>
                    <li><a href="#">Ajuda</a></li>
                </ul>
            </nav>

        </header>


        <%
            HttpSession prodSessionRecebe = request.getSession();
            Produto prod = (Produto) prodSessionRecebe.getAttribute("prod");

        %>
        <div class="produto-back">
            <div class="container">
                <div class="row">
                    <div class="col-md-12">
                        <img src="<%=prod.getImagem()%>" class="img-responsive">


                        <div class="produto">
                            <h1><%=prod.getNomeProd()%></h1>
                            <p>por apenas R$ <%=prod.getPreco()%></p>
                            <%if (cliente == null) {%>
                            <form action="/TchunaiFashion/login.jsp" method="GET">
                                <%} else {%>   
                                <form action="/TchunaiFashion/AddCarrinhoServlet" method="GET">
                                    <%}%>    Tamanho:
                                    <select name="tam">
                                        <option value="P">P</option>
                                        <option value="M">M</option>
                                        <option value="G">G</option>
                                        <option value="GG">GG</option>
                                    </select>
                                    <input type="hidden" name="id" value="<%=prod.getIdProd()%>"/>
                                    <input type="submit" class="comprar" value="Comprar">
                                </form>
                        </div>


                    </div>
                </div>

                <div class="detalhes">
                    <h2>Detalhes do produto</h2>
                    <p><%=prod.getDescricao()%></p>
                    <!--table>
                        <thead>
                            <tr>
                                <th>Caracter�stica</th>
                                <th>Detalhe</th>
                            </tr>
                        </thead>
                        <tbody>
                            <tr>
                                <td>Modelo</td>
                                <td>Cardig� 7845</td>
                            </tr>
                            <tr>
                                <td>Material</td>
                                <td>Algod�o e poliester</td>
                            </tr>
                            <tr>
                                <td>Cores</td>
                                <td>Azul, Rosa e Verde</td>
                            </tr>
                            <tr>
                                <td>Lavagem</td>
                                <td>Lavar a m�o</td>
                            </tr>
                        </tbody>
                    </table-->
                </div>
            </div>
        </div>
        <footer>
            <div class="container">
                <img src="img/logo-rodape.png" alt="Logo Mirror Fashion" style="width:80px; height: 60px;">
                <p>&copy; Copyright Tchunai Fashion</p>
                <ul class="social">
                    <li><a href="http://facebook.com/tchunaifashion">Facebook</a></li>
                    <li><a href="http://twitter.com/tchunaifashion">Twitter</a></li>
                    <li><a href="http://plus.google.com/tchunaifashion">Google+</a></li>
                    <li><a href="http://tchunaifashion.tumblr.com">Tumblr</a></li>
                    <li><a href="https://instagram.com/tchunaifashion">Instagram</a></li>
                    <li><a href="https://www.pinterest.com/tchunaifashion">Pinterest</a></li>
                </ul>
            </div>
        </footer>
    </body>

</html>
