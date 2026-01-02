<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>View Score </title>


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
}


.header {
    background: linear-gradient(135deg, var(--violet-main), var(--violet-light));
    padding: 1rem 2rem;
    color: white;
    display: flex;
    justify-content: space-between;
    align-items: center;
    box-shadow: 0 8px 25px rgba(124, 58, 237, 0.2);
}

.header h2 {
    margin: 0;
    font-size: 1.4rem;
}

.header a {
    color: white;
    text-decoration: none;
    border: 1px solid rgba(255,255,255,0.4);
    padding: 0.45rem 0.9rem;
    border-radius: 8px;
    transition: 0.25s;
}

.header a:hover {
    background: rgba(255,255,255,0.15);
}


.main {
    max-width: 900px;
    margin: 2.5rem auto;
    padding: 0 1.5rem;
}


.card {
    background: var(--white);
    border-radius: 14px;
    padding: 2rem;
    box-shadow: 0 10px 25px rgba(124, 58, 237, 0.15);
}


.card h1 {
    text-align: center;
    margin-top: 0;
    color: var(--violet-main);
}

.card h2 {
    text-align: center;
    color: var(--text-dark);
    margin-bottom: 1.5rem;
}


.message {
    text-align: center;
    padding: 1.2rem;
    border-radius: 10px;
    font-weight: 500;
}

.message.info {
    background: #EDE9FE;
    color: var(--violet-dark);
}

.message.error {
    background: #FEE2E2;
    color: #991B1B;
}


table {
    width: 100%;
    border-collapse: collapse;
    margin-top: 1rem;
}

table thead {
    background: #EDE9FE;
}

table th,
table td {
    padding: 0.8rem;
    text-align: center;
    border-bottom: 1px solid #DDD6FE;
}

table th {
    color: var(--violet-dark);
    font-weight: 600;
}

table tr:hover {
    background: #F5F3FF;
}

.footer {
    text-align: center;
    margin-top: 2rem;
}

.footer a {
    display: inline-block;
    background: linear-gradient(135deg, var(--violet-main), var(--violet-light));
    color: white;
    padding: 0.6rem 1.4rem;
    border-radius: 8px;
    text-decoration: none;
    font-weight: 500;
    transition: 0.25s;
}

.footer a:hover {
    background: linear-gradient(135deg, var(--violet-dark), var(--violet-main));
}
</style>
</head>

<body>


<div class="header">
    <h2>${initParam.appTitle}</h2>
    <a href="StudentMenu.jsp">
        <i class="fa-solid fa-arrow-left"></i> Back
    </a>
</div>


<jsp:useBean id="view" class="com.internship.quiz.beans.ShowScoreStudentBean"/>
<jsp:setProperty property="studentId" name="view" value="${sessionScope.lb.user.id}"/>
${view.displayScore()}


<div class="main">
<div class="card">

<c:choose>

    <c:when test="${empty view.arr}">
        <div class="message info">
            You have not attempted any quiz yet.
        </div>
    </c:when>

    <c:when test="${view.status==0}">
        <div class="message error">
            Something went wrong. Please try again later.
        </div>
    </c:when>

    <c:otherwise>
        <h2>Your Quiz Scores</h2>

        <table>
            <thead>
                <tr>
                    <th>Quiz Title</th>
                    <th>Score</th>
                    <th>Total Questions</th>
                </tr>
            </thead>
            <tbody>
                <c:forEach var="q" items="${view.arr}">
                    <tr>
                        <td>${q[0]}</td>
                        <td>${q[1]}</td>
                        <td>${q[2]}</td>
                    </tr>
                </c:forEach>
            </tbody>
        </table>
    </c:otherwise>

</c:choose>

<div class="footer">
    <a href="StudentMenu.jsp">
        <i class="fa-solid fa-house"></i> Student Menu
    </a>
</div>

</div>
</div>

</body>
</html>
