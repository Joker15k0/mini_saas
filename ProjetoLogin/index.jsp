
<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>

<!DOCTYPE html>
<html lang="pt-br">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Login do Sistema</title>

    <style>
        * {
            box-sizing: border-box;
        }

        body {
            margin: 0;
            font-family: Arial, sans-serif;
            background: linear-gradient(135deg, #141e30, #243b55);
            height: 100vh;
            display: flex;
            justify-content: center;
            align-items: center;
        }

        .login {
            background: white;
            padding: 40px;
            border-radius: 15px;
            width: 350px;
            box-shadow: 0 10px 30px rgba(0,0,0,0.3);
        }

        h1 {
            text-align: center;
            color: #243b55;
        }

        label {
            display: block;
            margin-top: 18px;
            font-weight: bold;
        }

        input {
            width: 100%;
            padding: 12px;
            margin-top: 7px;
            border: 1px solid #ccc;
            border-radius: 7px;
        }

        button {
            width: 100%;
            padding: 13px;
            margin-top: 25px;
            background: #243b55;
            color: white;
            border: none;
            border-radius: 7px;
            cursor: pointer;
            font-size: 16px;
        }

        button:hover {
            background: #141e30;
        }

        p {
            text-align: center;
            color: #777;
            font-size: 13px;
        }
    </style>
</head>

<body>

    <div class="login">

        <h1>Bem-vindo!</h1>

        <p>Acesse sua conta</p>

        <form action="login.jsp" method="POST">

            <label>Usuário:</label>
            <input type="text" name="user" required>

            <label>Senha:</label>
            <input type="password" name="password" required>

            <button type="submit">Entrar</button>

        </form>

    </div>

</body>
</html>
