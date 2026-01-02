<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Create Quiz </title>


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


.form-card {
    background: var(--white);
    width: 100%;
    max-width: 480px;
    padding: 2.5rem 2rem;
    border-radius: 12px;
    box-shadow: 0 10px 25px rgba(124, 58, 237, 0.15);
}


.form-title {
    text-align: center;
    font-size: 1.8rem;
    font-weight: 700;
    color: var(--violet-main);
    margin-bottom: 2rem;
}


.input-group {
    margin-bottom: 1.4rem;
}

.input-group label {
    display: block;
    font-size: 0.9rem;
    margin-bottom: 0.4rem;
    color: var(--text-primary);
}

.input-group input {
    width: 100%;
    padding: 0.7rem 0.75rem;
    border-radius: 8px;
    border: 1px solid var(--violet-accent);
    font-size: 0.95rem;
    outline: none;
    transition: all 0.25s cubic-bezier(0.4, 0, 0.2, 1);
}

.input-group input:focus {
    border-color: var(--violet-main);
    box-shadow: 0 0 0 3px rgba(124, 58, 237, 0.15);
}


.actions {
    margin-top: 2rem;
    display: flex;
    gap: 1rem;
    align-items: center;
}


.primary-btn {
    flex: 1;
    background: linear-gradient(135deg, var(--violet-main), var(--violet-light));
    color: white;
    border: none;
    padding: 0.75rem;
    font-size: 1rem;
    font-weight: 600;
    border-radius: 8px;
    cursor: pointer;
    transition: all 0.25s cubic-bezier(0.4, 0, 0.2, 1);
}

.primary-btn:hover {
    background: linear-gradient(135deg, var(--violet-dark), var(--violet-main));
}


.back-link {
    text-decoration: none;
    color: var(--violet-main);
    font-weight: 500;
    padding: 0.6rem 0.9rem;
    border-radius: 8px;
    border: 1px solid var(--violet-accent);
    transition: all 0.25s cubic-bezier(0.4, 0, 0.2, 1);
}

.back-link:hover {
    background: var(--violet-accent);
}
</style>
</head>

<body>

<div class="form-card">

    <div class="form-title">${initParam.appTitle}</div>

    <form method="post" action="CreateQuiz.jsp">

        <div class="input-group">
            <label>Title</label>
            <input type="text" name="title"/>
        </div>

        <div class="input-group">
            <label>Path</label>
            <input type="text" name="path"/>
        </div>

        <div class="actions">
            <button type="submit" class="primary-btn">
                <i class="fa-solid fa-circle-plus"></i> Create Quiz
            </button>
            <a href="AdminMenu.jsp" class="back-link">
                Go Back
            </a>
        </div>

    </form>

</div>

</body>
</html>
