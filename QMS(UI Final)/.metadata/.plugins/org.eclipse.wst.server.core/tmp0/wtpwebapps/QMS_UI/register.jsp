<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Registration Status </title>

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
    align-items: center;
    justify-content: center;
}


.status-card {
    background: var(--white);
    padding: 2.5rem 2.3rem;
    border-radius: 16px;
    text-align: center;
    width: 100%;
    max-width: 420px;
    box-shadow: 0 10px 30px rgba(124, 58, 237, 0.15);
}


.icon {
    font-size: 3rem;
    margin-bottom: 1rem;
}

.icon.fail {
    color: #DC2626;
}


.status-card h2 {
    margin-top: 0;
    margin-bottom: 0.8rem;
    color: var(--text-dark);
}

.status-card p {
    color: #6B7280;
    margin-bottom: 1.8rem;
}


.btn {
    display: inline-block;
    padding: 0.6rem 1.6rem;
    background: linear-gradient(135deg, var(--violet-main), var(--violet-light));
    color: white;
    border-radius: 10px;
    text-decoration: none;
    font-weight: 500;
    transition: 0.25s;
}

.btn:hover {
    background: linear-gradient(135deg, var(--violet-dark), var(--violet-main));
}
</style>
</head>

<body>


<jsp:useBean id="rb" class="com.internship.quiz.beans.StudentRegisterBean" scope="session"/>
<jsp:setProperty name="rb" property="*"/>
${rb.registerStudent() }

<div class="status-card">

<c:choose>

    <c:when test="${rb.status==0}">
        <div class="icon fail">
            <i class="fa-solid fa-circle-xmark"></i>
        </div>
        <h2>Registration Failed</h2>
        <p>Please check your details and try again.</p>
        <a href="StudentRegistration.jsp" class="btn">
            Register Again
        </a>
    </c:when>

    <c:otherwise>
        <c:redirect url="index.jsp"/>
    </c:otherwise>

</c:choose>

</div>

</body>
</html>
