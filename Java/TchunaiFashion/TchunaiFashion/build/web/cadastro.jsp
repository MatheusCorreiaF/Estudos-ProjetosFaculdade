<%-- 
    Document   : newjsp
    Created on : 21/07/2015, 12:57:22
    Author     : Usuario
--%>

<%@page import="br.com.tchunaifashion.services.UpdateTotal"%>
<%@page import="br.com.tchunaifashion.persistence.dao.ProdutoDAO"%>
<%@page import="br.com.tchunaifashion.model.Produto"%>
<%@page import="java.util.List"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>

    <head>     
        <meta charset="utf-8">
        <meta name="viewport" content="width=device-width">
        <title>Tchunai Fashion</title>
        <link rel="stylesheet" href="tchunai_css/reset.css">		
        <link rel="stylesheet" href="tchunai_css/cadastrocss.css">
        <link rel="stylesheet" href="tchunai_css/mobile.css" media="(max-width: 939px)">

        <script type="text/javascript">
            /* Máscaras ER */
            function mascara(o, f) {
                v_obj = o;
                v_fun = f;
                setTimeout("execmascara()", 1);
            }
            function execmascara() {
                v_obj.value = v_fun(v_obj.value);
            }
            function mtel(v) {
                v = v.replace(/\D/g, "");             //Remove tudo o que não é dígito
                v = v.replace(/^(\d{2})(\d)/g, "($1) $2"); //Coloca parênteses em volta dos dois primeiros dígitos
                v = v.replace(/(\d)(\d{4})$/, "$1-$2");    //Coloca hífen entre o quarto e o quinto dígitos
                return v;
            }
            function id(el) {
                return document.getElementById(el);
            }
            window.onload = function () {
                id('tel').onkeyup = function () {
                    mascara(this, mtel);
                };
            };
        </script>

    </head>

    <%
        HttpSession sessionRecebeListaCarrinho = request.getSession();
        List<Produto> listaCarrinho = (List<Produto>) sessionRecebeListaCarrinho.getAttribute("listaCarrinho");
        int i = 0;
                    UpdateTotal ut = new UpdateTotal();
    %>

    <body>


        <header class="container">

            <h1><img class="logo" src="img/logo.png" alt="Tchunai Fashion"></h1>

            <div class="sacola" class="container" >
                <div style="font-weight:bold; font-family: Oxygen; font-size:12px; margin-left: 50px; margin-top: 1px;">
                    <%if(listaCarrinho==null){%>
                                <a id="qtd-sacola" href="carrinho.jsp" title="Minha Compra">0 Produtos</a>
                                <a rel="noindex nofollow" id="val-sacola" href="carrinho.jsp" title="Minha Compra"><br>R$ 0.00</a>
				<%}else{%><a id="qtd-sacola" href="carrinho.jsp" title="Minha Compra"><%=listaCarrinho.size()%> Produtos</a>
                                          <a rel="noindex nofollow" id="val-sacola" href="carrinho.jsp" title="Minha Compra"><br>R$ <%=ut.preco(listaCarrinho)%></a> 
                                <%}%>            
                </div>
            </div>

            <nav class="menu-setores">
                <ul>
                    <li><a href="index.jsp">Início</a></li>
                    <li><a href="#">Lista de Desejos</a></li>
                    <li><a href="#">Cartão Fidelidade</a></li>
                    <li><a href="sobre.html">Sobre</a></li>
                    <li><a href="#">Ajuda</a></li>
                </ul>
            </nav>

        </header>
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
            </section>

            <div class="loginheader">
                <h1> Identificação</h1><br>
                <div class="dcadastro">
                    <h2>Dados Cadastrais</h2>
                    <br>



                    <form action="CadastroUsuarioServlet" method="POST" >
                        <%
                            if (request.getAttribute("valmessage") == null) {
                        %>
                        <span style="display: none;" class="failer"><%= request.getAttribute("valmessage")%></span>
                        <%
                        } else {
                        %>  
                        <span class="failer"><%= request.getAttribute("valmessage")%></span>
                        <%}%>
                        <li>
                            <span>Nome Completo:</span>
                            <input type="text" name="nome" placeholder="Nome Completo" required>
                        </li><br>
                        <li>
                            <span>CPF:</span>
                            <input type="text"  name="cpf"  pattern="[0-9]+$" maxlength="11" placeholder="CPF (somente números)" required />
                        </li><br>
                        <li>
                            <span>Telefone:</span>
                            <input type="tel" required="required" maxlength="15" name="tel" id="tel" placeholder="DDD ####-####"/>
                        </li><br>
                        <li>
                            <span>Email:</span>
                            <input type="email" required="required" class="input-text" name="email" pattern="[a-z0-9._%+-]+@[a-z0-9.-]+\.[a-z]{2,4}$" />
                        </li><br>
                        <li>
                            <span>Senha:</span>
                            <input type="password" name="senha">
                        </li><br>

                        <h2>Endereço de Entrega:</h2>
                        <br>
                        <span>Estado:</span>
                        <select name="estado">
                            <option value="">Selecione</option>
                            <option value="AC">Acre</option>
                            <option value="AL">Alagoas</option>
                            <option value="AP">Amapá</option>
                            <option value="AM">Amazonas</option>
                            <option value="BA">Bahia</option>
                            <option value="CE">Ceará</option>
                            <option value="DF">Distrito Federal</option>
                            <option value="ES">Espirito Santo</option>
                            <option value="GO">Goiás</option>
                            <option value="MA">Maranhão</option>
                            <option value="MS">Mato Grosso do Sul</option>
                            <option value="MT">Mato Grosso</option>
                            <option value="MG">Minas Gerais</option>
                            <option value="PA">Pará</option>
                            <option value="PB">Paraíba</option>
                            <option value="PR">Paraná</option>
                            <option value="PE">Pernambuco</option>
                            <option value="PI">Piauí</option>
                            <option value="RJ">Rio de Janeiro</option>
                            <option value="RN">Rio Grande do Norte</option>
                            <option value="RS">Rio Grande do Sul</option>
                            <option value="RO">Rondônia</option>
                            <option value="RR">Roraima</option>
                            <option value="SC">Santa Catarina</option>
                            <option value="SP">São Paulo</option>
                            <option value="SE">Sergipe</option>
                            <option value="TO">Tocantins</option>
                        </select><br><br>
                        <li>
                            <span>Cidade:</span>
                            <input type="text" name="cidade">
                        </li><br>
                        <li>
                            <span>CEP:</span>
                            <input type="text" name="cep" pattern="[0-9]+$" required/>
                        </li><br>
                        <li>
                            <span>Bairro:</span>
                            <input type="text" name="bairro" required/>
                        </li><br>
                        <li>
                            <span>Endereço: </span>
                            <input type="text" name="endereco" required/>
                        </li><br>
                        <li>
                            <span>Número:</span>
                            <input type="text" name="numero"  required/>
                        </li><br>
                        <li>
                            <span>Complemento:</span>
                            <input type="text" name="complemento" />
                        </li><br>

                        <input class="bts" type="submit" value="Cadastrar" />
                        <br><br>
                    </form>
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

