<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Login </title>


<link href="https://fonts.googleapis.com/css2?family=Inter:wght@400;500;600;700&display=swap" rel="stylesheet">


<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.5.0/css/all.min.css"/>

<style>
:root {
    --violet-main: #7C3AED;
    --violet-dark: #5B21B6;
    --violet-light: #8B5CF6;
    --violet-accent: #C4B5FD;
    --bg-light: #FAF5FF;
    --white: #FFFFFF;
    --text-primary: #1F2937;
    --text-secondary: #6B7280;
}

* {
    box-sizing: border-box;
    font-family: 'Inter', sans-serif;
}

body {
    margin: 0;
    min-height: 100vh;
    background: linear-gradient(135deg, var(--bg-light), #EDE9FE);
    display: flex;
    align-items: center;
    justify-content: center;
}


.login-card {
    background: var(--white);
    width: 100%;
    max-width: 500px;
    padding: 2.5rem 2rem;
    border-radius: 12px;
    box-shadow: 0 10px 25px rgba(124, 58, 237, 0.15);
    text-align: center;
}


.login-title {
    font-size: 1.8rem;
    font-weight: 700;
    color: var(--violet-main);
    margin-bottom: 0.5rem;
}

.sub-title {
    color: var(--text-secondary);
    margin-bottom: 2rem;
}


.input-group {
    text-align: left;
    margin-bottom: 1.4rem;
}

.input-group label {
    display: block;
    font-size: 0.9rem;
    margin-bottom: 0.4rem;
    color: var(--text-primary);
}

.input-group i {
    position: absolute;
    top: 50%;
    left: 12px;
    transform: translateY(-50%);
    color: var(--violet-main);
}

.input-wrapper {
    position: relative;
}

.input-wrapper input {
    width: 100%;
    padding: 0.7rem 0.75rem 0.7rem 2.5rem;
    border-radius: 8px;
    border: 1px solid var(--violet-accent);
    font-size: 0.95rem;
    outline: none;
    transition: all 0.25s cubic-bezier(0.4, 0, 0.2, 1);
}

.input-wrapper input:focus {
    border-color: var(--violet-main);
    box-shadow: 0 0 0 3px rgba(124, 58, 237, 0.15);
}


.login-btn {
    width: 100%;
    background: linear-gradient(135deg, var(--violet-main), var(--violet-light));
    color: white;
    border: none;
    padding: 0.8rem;
    font-size: 1rem;
    font-weight: 600;
    border-radius: 8px;
    cursor: pointer;
    transition: all 0.25s cubic-bezier(0.4, 0, 0.2, 1);
}

.login-btn:hover {
    background: linear-gradient(135deg, var(--violet-dark), var(--violet-main));
}


.signup-text {
    margin-top: 1.5rem;
    font-size: 0.9rem;
    color: var(--text-secondary);
}

.signup-text a {
    color: var(--violet-main);
    text-decoration: none;
    font-weight: 500;
}

.signup-text a:hover {
    text-decoration: underline;
}
</style>
</head>

<body>

<div class="login-card">

    <div class="login-title">${initParam.appTitle}</div>
    <div class="sub-title">Sign in to your account</div>

    <form method="post" action="login.jsp">

        <div class="input-group">
            <label>Email</label>
            <div class="input-wrapper">
                <i class="fa-solid fa-envelope"></i>
                <input type="text" name="email"/>
            </div>
        </div>

        <div class="input-group">
            <label>Password</label>
            <div class="input-wrapper">
                <i class="fa-solid fa-lock"></i>
                <input type="password" name="passwd"/>
            </div>
        </div>

        <input type="submit" name="passwd" value="LOGIN" class="login-btn"/>

        <div class="signup-text">
            Don’t have an account?
            <a href="StudentRegistration.jsp">Sign Up</a>
        </div>

    </form>

</div>

</body>
</html>
