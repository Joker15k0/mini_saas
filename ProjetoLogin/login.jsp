
<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>

<%
String usuario = request.getParameter("user");
String senha = request.getParameter("password");

if (usuario == null || senha == null ||
    usuario.trim().isEmpty() || senha.isEmpty()) {

    response.sendRedirect("index.jsp");
    return;
}

// LOGIN TEMPORÁRIO SEM BANCO DE DADOS
String usuarioCorreto = "admin";
String senhaCorreta = "123456";

if (usuario.equals(usuarioCorreto) &&
    senha.equals(senhaCorreta)) {

    // Cria a sessão do usuário
    session.setAttribute("usuario", usuario);

    // Token temporário para testes
    session.setAttribute("token", "LOGIN-LOCAL-TESTE");

    // Vai para a página inicial
    response.sendRedirect("home.jsp");
    return;

} else {
%>

<!DOCTYPE html>
<html lang="pt-BR">
<head>
    <meta charset="UTF-8">
    <title>Erro no Login</title>
</head>
<body>
    <h2>Usuário ou senha incorretos!</h2>
    <a href="index.jsp">Voltar ao login</a>
</body>
</html>

<%
}
%>
