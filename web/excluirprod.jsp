<%@page import="javax.swing.JOptionPane"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="java.sql.Connection"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.DriverManager"%>

<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Excluiro produtos</title>
    </head>
    <body>
        <%
            try {
                // Recebe o dado codigo do formulario
                int cod;
                cod = Integer.parseInt(request.getParameter("codigoprod"));
                //Conectar com o banco de dados
                Connection conecta;
                PreparedStatement st;
                Class.forName("com.mysql.cj.jdbc.Driver");
                conecta = DriverManager.getConnection("jdbc:mysql://localhost:3306/dbsweb", "root", "123456");

                //Excluir os dados na tabela Produtos no banco de dados
                st = conecta.prepareStatement("DELETE FROM produto WHERE codigoprod=?");
                st.setInt(1, cod);
                int resultado = st.executeUpdate(); // executa o comando delete
                //verifica se o produto foi excluido
                if (resultado == 0) {
                    out.print("<p style='color: red;font-size:30px;font-weight:bold'>Esse produto não esta cadastrado!</p>");
                } else {
                    out.print("<p style='color: green;font-size:30px;font-weight:bold'>O produto do codigo " + cod + " foi excluido com sucesso!");
                }

            } catch (Exception e) {
                String mensagemErro = e.getMessage();
                out.print("<p style='color: red;font-size:30px;font-weight:bold'>Informar o suporte a mensagem de erro:</p>" + mensagemErro);
            }

        %>
    </body>
</html>
