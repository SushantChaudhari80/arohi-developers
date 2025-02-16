<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Login and Register</title>
    <style>
        body {
            font-family: Arial, sans-serif;
            background-color: #f0f0f0;
            display: flex;
            justify-content: center;
            align-items: center;
            height: 100vh;
            margin: 0;
        }
        .container {
            background: white;
            padding: 20px;
            border-radius: 8px;
            box-shadow: 0 4px 10px rgba(0, 0, 0, 0.1);
            width: 300px;
        }
        .tabs {
            display: flex;
            justify-content: space-between;
            margin-bottom: 20px;
        }
        .tab-button {
            background: none;
            border: none;
            cursor: pointer;
            font-weight: bold;
            padding: 10px;
            outline: none;
        }
        .tab-button.active {
            border-bottom: 2px solid #3897f0;
        }
        .form {
            display: none;
        }
        .form.active {
            display: block;
        }
        input {
            width: 100%;
            padding: 10px;
            margin: 10px 0;
            border: 1px solid #ddd;
            border-radius: 5px;
        }
        button {
            width: 100%;
            padding: 10px;
            background-color: #3897f0;
            color: white;
            border: none;
            border-radius: 5px;
            cursor: pointer;
        }
    </style>
</head>
<body>
    <div class="container">
        <div class="tabs">
            <button class="tab-button active" onclick="showLogin()">Login</button>
            <button class="tab-button" onclick="showRegister()">Register</button>
        </div>
        
        <div class="form-container">
            <form id="login-form" class="form active" action="loginAction.jsp" method="post">
                <h2>Login</h2>
                <input type="text" name="username" placeholder="Username" required>
                <input type="password" name="password" placeholder="Password" required>
                <button type="submit">Login</button>
            </form>

            <form id="register-form" class="form" action="registerAction.jsp" method="post">
                <h2>Register</h2>
                <input type="text" name="username" placeholder="Username" required>
                <input type="email" name="email" placeholder="Email" required>
                <input type="password" name="password" placeholder="Password" required>
                <button type="submit">Register</button>
            </form>
        </div>
    </div>

    <script>
        function showLogin() {
            document.getElementById('login-form').classList.add('active');
            document.getElementById('register-form').classList.remove('active');
            document.querySelector('.tab-button.active').classList.remove('active');
            document.querySelector('.tab-button:nth-of-type(1)').classList.add('active');
        }

        function showRegister() {
            document.getElementById('register-form').classList.add('active');
            document.getElementById('login-form').classList.remove('active');
            document.querySelector('.tab-button.active').classList.remove('active');
            document.querySelector('.tab-button:nth-of-type(2)').classList.add('active');
        }
    </script>
</body>
</html>
