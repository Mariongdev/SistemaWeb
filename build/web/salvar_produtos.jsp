<%@page import="java.sql.Connection"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.DriverManager"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
        <%
            // Receber os dads digitados no formulario cadprod.htm
            int cp;
            String np, mp;
            double pp;
            cp = Integer.parseInt(request.getParameter("codigoprod"));
            np = request.getParameter("nomeprod");
            mp = request.getParameter("marcaprod");
            pp = Double.parseDouble(request.getParameter("precoprod"));

            try {
                //Fazer a conexão com o Banco de Dados
                Connection conecta;
                PreparedStatement st;
                Class.forName("com.mysql.cj.jdbc.Driver");
                conecta = DriverManager.getConnection("jdbc:mysql://localhost:3306/dbsweb", "root", "123456");

                //Inserir os dados na tabela Produtos no banco de dados
                st = conecta.prepareStatement("INSERT INTO produto VALUES(?,?,?,?)");
                st.setInt(1, cp);
                st.setString(2, np);
                st.setString(3, mp);
                st.setDouble(4, pp);
                st.executeUpdate(); // Executa o comando INSERT 
                out.print("<p style='color: green;font-size:30px;font-weight:bold'>Produto cadastrado com sucesso!");
            } catch (Exception e) {
                String erro = e.getMessage();
                if (erro.contains("Duplicate entry")) {
                    out.print("<p style='color: red;font-size:30px;font-weight:bold'>Esse código já está cadastrado!");

                } else {
                    out.print("<p style='color: red;font-size:30px;font-weight:bold'>Informar o suporte a mensagem de erro:</p>" + erro);
                }
            }
        %>
    </body>
</html>
