<%@page import="java.sql.Connection"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.ResultSet"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Listagem de produtos</title>
        <link rel="stylesheet" href="tabelaprod.css"/>
    </head>
    <body>
        <%
            try {
                //Fazer a conexão com o Banco de Dados
                Connection conecta;
                PreparedStatement st;
                Class.forName("com.mysql.cj.jdbc.Driver");
                conecta = DriverManager.getConnection("jdbc:mysql://localhost:3306/dbsweb", "root", "123456");

                //Inserir os dados na tabela Produtos no banco de dados
                st = conecta.prepareStatement("SELECT *FROM produto ORDER BY precoprod");
                ResultSet rs = st.executeQuery();
        %>
        <table>

            <tr>

                <th>Código</th>
                <th>Nome do Produto</th>
                <th>Marca</th>
                <th>Preço</th>
                <th>Exclusão</th>
                

                <%
                    while (rs.next()) {
                %>

            <tr>

                <td><%= rs.getString("codigoprod")%></td>
                <td><%= rs.getString("nomeprod")%></td>
                <td><%= rs.getString("marcaprod")%></td>
                <td><%= rs.getString("precoprod")%></td>
                <td><a href="excluirprod.jsp?codigoprod=<%=rs.getString("codigoprod")%>"><input type="button" value="Excluir"></a></td>
                
            <%
                }
            %>

        </table>
        <%
            } catch (Exception e) {
                out.print("<p style='color: red;font-size:30px;font-weight:bold'>Informar o suporte a mensagem de erro:</p>" + e.getMessage());
            }


        %>

    </body>
</html>
