<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Student Registration </title>


<link href="https://fonts.googleapis.com/css2?family=Inter:wght@400;500;600;700&display=swap" rel="stylesheet">


<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.5.0/css/all.min.css"/>

<style>
:root {
    --violet-main: #7C3AED;
    --violet-dark: #5B21B6;
    --violet-light: #8B5CF6;
    --violet-bg: #FAF5FF;
    --white: #FFFFFF;
    --text-dark: #1F2937;
    --text-light: #6B7280;
}

* {
    box-sizing: border-box;
    font-family: 'Inter', sans-serif;
}

body {
    margin: 0;
    min-height: 100vh;
    background: linear-gradient(135deg, var(--violet-bg), #EDE9FE);
    display: flex;
    justify-content: center;
    align-items: center;
}

.register-card {
    background: var(--white);
    padding: 2.5rem 2.2rem;
    border-radius: 14px;
    width: 100%;
    max-width: 420px;
    box-shadow: 0 10px 25px rgba(124, 58, 237, 0.15);
}


.register-card h1 {
    margin-top: 0;
    margin-bottom: 0.5rem;
    text-align: center;
    color: var(--violet-main);
    font-size: 1.8rem;
}

.subtitle {
    text-align: center;
    color: var(--text-light);
    margin-bottom: 2rem;
}


.form-group {
    margin-bottom: 1.4rem;
}

.form-group label {
    display: block;
    margin-bottom: 0.4rem;
    font-weight: 500;
    color: var(--text-dark);
}

.form-group input {
    width: 100%;
    padding: 0.65rem 0.75rem;
    border-radius: 8px;
    border: 1px solid #DDD6FE;
    font-size: 0.95rem;
    transition: all 0.25s cubic-bezier(0.4, 0, 0.2, 1);
}

.form-group input:focus {
    outline: none;
    border-color: var(--violet-main);
    box-shadow: 0 0 0 3px rgba(124, 58, 237, 0.15);
}


.submit-btn {
    width: 100%;
    background: linear-gradient(135deg, var(--violet-main), var(--violet-light));
    border: none;
    color: white;
    padding: 0.75rem;
    font-size: 1rem;
    border-radius: 10px;
    cursor: pointer;
    font-weight: 500;
    margin-top: 0.8rem;
    transition: all 0.25s cubic-bezier(0.4, 0, 0.2, 1);
}

.submit-btn:hover {
    background: linear-gradient(135deg, var(--violet-dark), var(--violet-main));
}

.footer-text {
    margin-top: 1.5rem;
    text-align: center;
    font-size: 0.9rem;
}

.footer-text a {
    color: var(--violet-main);
    text-decoration: none;
    font-weight: 500;
}

.footer-text a:hover {
    text-decoration: underline;
}
</style>
</head>

<body>

<div class="register-card">

    <h1>${initParam.appTitle}</h1>
    <div class="subtitle">Create your student account</div>

    <form method="post" action="register.jsp">

        <div class="form-group">
            <label>Name</label>
            <input type="text" name="name" required>
        </div>

        <div class="form-group">
            <label>Email</label>
            <input type="text" name="email" required>
        </div>

        <div class="form-group">
            <label>Password</label>
            <input type="password" name="passwd" required>
        </div>

        <input type="submit" value="Register" class="submit-btn">

    </form>

    <div class="footer-text">
        Already have an account?
        <a href="index.jsp">Login</a>
    </div>

</div>

</body>
</html>
