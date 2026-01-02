<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Delete Quiz </title>


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
    --error: #DC2626;
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
    display: flex;
    align-items: center;
    justify-content: center;
}

.result-card {
    background: var(--white);
    width: 100%;
    max-width: 420px;
    padding: 2.5rem 2rem;
    border-radius: 12px;
    box-shadow: 0 10px 25px rgba(124, 58, 237, 0.15);
    text-align: center;
}

/* ===== ICON ===== */
.result-icon {
    font-size: 3rem;
    color: var(--error);
    margin-bottom: 1rem;
}

/* ===== MESSAGE ===== */
.result-message {
    font-size: 1.4rem;
    font-weight: 700;
    color: var(--text-primary);
    margin-bottom: 1.5rem;
}

.back-btn {
    text-decoration: none;
    color: white;
    background: linear-gradient(135deg, var(--violet-main), var(--violet-light));
    padding: 0.7rem 1.4rem;
    border-radius: 8px;
    font-weight: 500;
    display: inline-block;
    transition: all 0.25s cubic-bezier(0.4, 0, 0.2, 1);
}

.back-btn:hover {
    background: linear-gradient(135deg, var(--violet-dark), var(--violet-main));
}
</style>
</head>

<body>

<jsp:useBean id="fq" class="com.internship.quiz.beans.FindQuizBean"/>
<jsp:setProperty name="fq" property="*" />
${fq.find()}

<jsp:useBean id="deleteQ" class="com.internship.quiz.beans.DeleteQuizBean" scope="session"/>
<jsp:setProperty property="quizid" name="deleteQ" value="${fq.quiz.id}" />
${deleteQ.delete()}

<c:choose>

    <c:when test="${deleteQ.status==0}">
        <div class="result-card">
            <div class="result-icon">
                <i class="fa-solid fa-circle-xmark"></i>
            </div>
            <div class="result-message">
                Deletion Failed !!
            </div>
            <a href="listQuizAdmin.jsp" class="back-btn">
                Go Back
            </a>
        </div>
    </c:when>

    <c:otherwise>
        <c:redirect url="listQuizAdmin.jsp"/>
    </c:otherwise>

</c:choose>

</body>
</html>
