
<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>

<%
String token = (String) session.getAttribute("token");

if (token == null || !token.equals("LOGIN-LOCAL-TESTE")) {
    response.sendRedirect("index.jsp");
    return;
}

String usuario = (String) session.getAttribute("usuario");
%>

<!DOCTYPE html>
<html lang="pt-br">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">

    <title>Área do Sistema</title>

    <style>
        body {
            font-family: Arial, sans-serif;
            background: #141e30;
            color: white;
            display: flex;
            justify-content: center;
            align-items: center;
            height: 100vh;
            margin: 0;
        }

        .painel {
            background: white;
            color: #243b55;
            padding: 40px;
            border-radius: 15px;
            text-align: center;
            width: 400px;
        }

        h1 {
            color: #16834a;
        }

        .botao {
            display: inline-block;
            background: #c0392b;
            color: white;
            padding: 12px 25px;
            border-radius: 7px;
            text-decoration: none;
            margin-top: 20px;
        }

        .botao:hover {
            background: #922b21;
        }
    </style>
</head>

<body>

    <div class="painel">

        <h1>Login realizado!</h1>

        <h2>Bem-vindo, <%= usuario %>!</h2>

        <p>Você entrou no sistema com sucesso.</p>

        <p>Autenticação temporária sem banco de dados.</p>

        <a class="botao" href="logout.jsp">Sair do sistema</a>

    </div>

</body>
</html>
