<%-- 
    Document   : carrinho
    Created on : 26/07/2015, 14:22:41
    Author     : Matheus Correia
--%>

<%@page import="br.com.tchunaifashion.model.Cliente"%>
<%@page import="br.com.tchunaifashion.services.UpdateTotal"%>
<%@page import="java.util.List"%>
<%@page import="br.com.tchunaifashion.model.Produto"%>
<%@page import="br.com.tchunaifashion.model.Produto"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>

    <head>
        <meta charset="utf-8">
        <meta name="viewport" content="width=device-width">
        <title>Produto da Tchunai Fashion</title>
        <link rel="stylesheet" href="tchunai_css/reset.css">
        <link rel="stylesheet" href="tchunai_css/carrinhocss.css">
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
                    <li><a href="#">Cartão Fidelidade</a></li>
                    <li><a href="sobre.html">Sobre</a></li>
                    <li><a href="#">Ajuda</a></li>
                </ul>
            </nav>

        </header>
        <div class="produto-back">
            <div class="container destaque">
                <section class="busca">
                    <h2>Busca</h2>

                    <form action="http://www.google.com.br/search" id="form-busca">
                        <input type="search" name="q" id="q">
                        <input type="image" src="img/busca.png">
                    </form>

                </section><!-- fim .busca -->

                <section class="menu-departamentos">
                    <h2>Departamentos</h2>
                    <nav>
                        <ul>
                            <li>
                                <a class="teste" href="../TchunaiFashion/CamisaeCamisetaServlet">Camisas e Camisetas</a>
                                <ul>
                                    <li><a href="../TchunaiFashion/CamisaServlet">Camisas</a></li>
                                    <li><a href="../TchunaiFashion/CamisetaServlet">Camisetas</a></li>
                                </ul>
                            </li>
                            <li><a class="teste" href="../TchunaiFashion/SaiaeVestidoServlet">Saias e Vestidos</a>
                                <ul>
                                    <li><a href="../TchunaiFashion/SaiaServlet">Saias</a></li>
                                    <li><a href="../TchunaiFashion/VestidoServlet">Vestidos</a></li>
                                </ul>
                            </li>
                            <li><a href="../TchunaiFashion/CalcaServlet">Calças</a></li>
                            <li><a href="../TchunaiFashion/BermudaServlet">Bermudas</a></li>
                            <li><a href="../TchunaiFashion/BlazerServlet">Blazers</a></li>		  
                        </ul>
                    </nav>
                </section><!-- fim .menu-departamentos -->




                <div class="pedidos">
                    <%if (listaCarrinho != null && listaCarrinho.size() != 0) {%>
                    <ul>
                        <%while (i < listaCarrinho.size()) {%>
                        <li>
                            <img src="<%=listaCarrinho.get(i).getImagem()%>"/>
                            <p><%=listaCarrinho.get(i).getNomeProd()%></p>
                            <p id="tam">Tamanho: <%=listaCarrinho.get(i).getTamanho()%></p>
                            <p id="preco">Preço: R$<%=listaCarrinho.get(i).getPreco()%></p>
                            <form action="/TchunaiFashion/RemoveCarrinhoServlet" method="GET">
                                <input type="hidden" name="indiceLista" value="<%=i%>"/>
                                <input type="submit" class="detailRemove" value="Remover" name="remove" />
                            </form>
                        </li>
                        <%i++;
                            }%>
                        <p id="total">Total R$<%=ut.preco(listaCarrinho)%></p>
                    </ul>
                    <!--a href="index.jsp"><img id="continuar" src="img/btcontinuar.png"></a-->
                    <form action="/TchunaiFashion">
                        <input type="submit" class="detailContinua" value="Continuar" name="continua" />
                    </form>

                    <form action="/TchunaiFashion/FinalizarCompraServlet" method="post">
                        <input type="submit" class="detailFinaliza" value="Finalizar" name="finaliza" />
                    </form>
                    <%}
                        if (listaCarrinho == null) {%>
                    <h1>Você não possui itens no carrinho!</h1>
                    <%} else if (listaCarrinho.isEmpty()) {%>
                    <h1>Você não possui itens no carrinho!</h1>
                    <%}%>
                </div>    
            </div>
        </div>
        <footer style="margin-top: 130px;">
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
