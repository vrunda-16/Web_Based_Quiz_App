<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Quiz Result </title>


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
    justify-content: center;
    align-items: center;
}


.result-card {
    background: var(--white);
    padding: 2.8rem 2.5rem;
    border-radius: 18px;
    width: 100%;
    max-width: 520px;
    text-align: center;
    box-shadow: 0 15px 35px rgba(124, 58, 237, 0.2);
}


.icon {
    font-size: 3.5rem;
    margin-bottom: 1rem;
}

.icon.success {
    color: #16A34A;
}

.icon.fail {
    color: #DC2626;
}


.result-card h1 {
    color: var(--violet-main);
    margin-top: 0;
}

.result-card h2 {
    margin: 0.6rem 0;
    color: var(--text-dark);
}


.score-box {
    background: #F5F3FF;
    border-radius: 14px;
    padding: 1.5rem;
    margin: 1.5rem 0;
}

.score-box p {
    margin: 0.5rem 0;
    font-size: 1.05rem;
    font-weight: 500;
}


.actions {
    display: flex;
    justify-content: center;
    gap: 1rem;
    margin-top: 2rem;
}

.actions a {
    text-decoration: none;
    padding: 0.65rem 1.6rem;
    border-radius: 10px;
    font-weight: 500;
    transition: 0.25s;
}

.btn-primary {
    background: linear-gradient(135deg, var(--violet-main), var(--violet-light));
    color: white;
}

.btn-primary:hover {
    background: linear-gradient(135deg, var(--violet-dark), var(--violet-main));
}

.btn-outline {
    border: 1px solid var(--violet-main);
    color: var(--violet-main);
}

.btn-outline:hover {
    background: #EDE9FE;
}
</style>
</head>

<body>


<jsp:useBean id="submitQuiz" class="com.internship.quiz.beans.QuizSubmitBean" scope="request"/>
<jsp:setProperty property="studentId" name="submitQuiz" value="${sessionScope.lb.user.id}"/>
<jsp:setProperty property="quizid" name="submitQuiz" param="quizid"/>
<%
    submitQuiz.calResult(request);
%>

<div class="result-card">

<h1>${initParam.appTitle}</h1>

<c:choose>

    <c:when test="${submitQuiz.status==0}">
        <div class="icon fail">
            <i class="fa-solid fa-circle-xmark"></i>
        </div>
        <h2>Failed to Submit Quiz</h2>
        <p>Please try again later.</p>
    </c:when>

    <c:otherwise>
        <div class="icon success">
            <i class="fa-solid fa-trophy"></i>
        </div>
        <h2>Congratulations!</h2>

        <div class="score-box">
            <p><strong>Score:</strong> ${submitQuiz.final_score}</p>
            <p><strong>Total Questions:</strong> ${submitQuiz.total_questions}</p>
        </div>
    </c:otherwise>

</c:choose>

<div class="actions">
    <a href="showQuiz.jsp" class="btn-outline">
        <i class="fa-solid fa-arrow-left"></i> Go Back
    </a>
    <a href="logout.jsp" class="btn-primary">
        <i class="fa-solid fa-right-from-bracket"></i> Sign Out
    </a>
</div>

</div>

</body>
</html>
