<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Available Quizzes</title>


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
}

* {
    box-sizing: border-box;
    font-family: 'Inter', sans-serif;
}

body {
    margin: 0;
    min-height: 100vh;
    background: linear-gradient(135deg, var(--bg-light), #EDE9FE);
}


.header {
    background: linear-gradient(135deg, var(--violet-main), var(--violet-light));
    padding: 1rem 2rem;
    display: flex;
    justify-content: space-between;
    align-items: center;
    box-shadow: 0 10px 25px rgba(124, 58, 237, 0.15);
}

.header-title {
    color: white;
    font-size: 1.5rem;
    font-weight: 700;
}

.header-actions a {
    color: white;
    text-decoration: none;
    margin-left: 1rem;
    padding: 0.45rem 0.9rem;
    border-radius: 8px;
    border: 1px solid rgba(255,255,255,0.4);
    transition: all 0.25s;
}

.header-actions a:hover {
    background: rgba(255,255,255,0.15);
}


.main {
    max-width: 1000px;
    margin: 3rem auto;
    padding: 0 1.5rem;
    text-align: center;
}

.main h1 {
    color: var(--violet-main);
    margin-bottom: 0.5rem;
}

.main h2 {
    margin-bottom: 2rem;
    color: #4B5563;
}


.table-container {
    background: var(--white);
    border-radius: 12px;
    box-shadow: 0 4px 20px rgba(124, 58, 237, 0.1);
    overflow: hidden;
    border: 1px solid var(--violet-accent);
}

table {
    width: 100%;
    border-collapse: collapse;
}

thead {
    background: linear-gradient(135deg, var(--violet-main), var(--violet-light));
    color: white;
}

th, td {
    padding: 1rem;
    text-align: center;
}

tbody tr {
    border-bottom: 1px solid #EDE9FE;
}

tbody tr:hover {
    background-color: #F5F3FF;
}


.start-btn {
    background: linear-gradient(135deg, var(--violet-main), var(--violet-light));
    color: white;
    padding: 0.4rem 1rem;
    border-radius: 6px;
    text-decoration: none;
    font-size: 0.9rem;
    font-weight: 500;
    transition: all 0.25s;
}

.start-btn:hover {
    background: linear-gradient(135deg, var(--violet-dark), var(--violet-main));
}


.footer-links {
    margin-top: 2rem;
}

.footer-links a {
    margin: 0 0.8rem;
    text-decoration: none;
    color: var(--violet-main);
    font-weight: 500;
}

.footer-links a:hover {
    text-decoration: underline;
}
</style>
</head>

<body>


<div class="header">
    <div class="header-title">${initParam.appTitle}</div>
    <div class="header-actions">
        <a href="StudentMenu.jsp"><i class="fa-solid fa-arrow-left"></i> Back</a>
        <a href="logout.jsp"><i class="fa-solid fa-right-from-bracket"></i> Sign Out</a>
    </div>
</div>


<jsp:useBean id="lq" class="com.internship.quiz.beans.ShowQuizStudentBean" scope="session"/>
<jsp:setProperty name="lq" property="studentId" value="${sessionScope.lb.user.id}"/>
${lq.show()}


<div class="main">

    <h1></h1>
  
    <c:choose>
    	<c:when test="${empty lq.list}">
    		<h2>No Quiz Available!</h2>
    	</c:when>
    	<c:otherwise>
    	<h2>Available Quizzes</h2>
    	 <div class="table-container">
        <table>
            <thead>
                <tr>
                    <th>Quiz ID</th>
                    <th>Quiz Name</th>
                    <th>Attempt</th>
                </tr>
            </thead>
            <tbody>
                <c:forEach var="q" items="${lq.list}">
                    <tr>
                        <td>${q.id}</td>
                        <td>${q.title}</td>
                        <td>
                            <a class="start-btn" href="attemptQuiz.jsp?quizid=${q.id}">
                                <i class="fa-solid fa-play"></i> Start
                            </a>
                        </td>
                    </tr>
                </c:forEach>
            </tbody>-
        </table>
    </div>
    	</c:otherwise>
    
    </c:choose>

    <div class="footer-links">
    </div>

</div>

</body>
</html>
