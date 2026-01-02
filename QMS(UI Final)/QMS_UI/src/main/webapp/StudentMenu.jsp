<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Student Menu</title>


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
    position: sticky;
    top: 0;
    background: linear-gradient(135deg, var(--violet-main), var(--violet-light));
    padding: 1rem 2rem;
    display: flex;
    justify-content: space-between;
    align-items: center;
    box-shadow: 0 10px 25px rgba(124, 58, 237, 0.15);
    z-index: 10;
}

.header-title {
    color: white;
    font-size: 1.5rem;
    font-weight: 700;
}

.logout-btn {
    color: white;
    text-decoration: none;
    font-weight: 500;
    padding: 0.45rem 0.9rem;
    border-radius: 8px;
    border: 1px solid rgba(255,255,255,0.4);
    transition: all 0.25s ease;
}

.logout-btn:hover {
    background: rgba(255,255,255,0.15);
}


.main {
    min-height: calc(100vh - 80px); 
    display: flex;
    align-items: center;      
    justify-content: center; 
    padding: 2rem 1.5rem;
}


.card-grid {
    width: 100%;
    max-width: 900px;
    display: grid;
    grid-template-columns: repeat(auto-fit, minmax(260px, 1fr));
    gap: 2rem;
    text-align: center;
}


.menu-card {
    background: var(--white);
    border-radius: 14px;
    padding: 2.2rem 1.5rem;
    box-shadow: 0 4px 20px rgba(124, 58, 237, 0.1);
    border: 1px solid var(--violet-accent);
    transition: all 0.25s ease;
}

.menu-card:hover {
    transform: translateY(-6px) scale(1.02);
    box-shadow: 0 10px 30px rgba(124, 58, 237, 0.18);
}

.menu-card i {
    font-size: 2.6rem;
    color: var(--violet-main);
    margin-bottom: 1.2rem;
}

.menu-card h3 {
    margin-bottom: 1.6rem;
    font-size: 1.25rem;
    font-weight: 600;
    color: var(--text-primary);
}


.menu-card input[type="submit"] {
    background: linear-gradient(135deg, var(--violet-main), var(--violet-light));
    color: white;
    border: none;
    padding: 0.75rem 1.6rem;
    border-radius: 10px;
    font-size: 0.95rem;
    font-weight: 500;
    cursor: pointer;
    transition: all 0.25s ease;
}

.menu-card input[type="submit"]:hover {
    background: linear-gradient(135deg, var(--violet-dark), var(--violet-main));
}
</style>
</head>

<body>


<div class="header">
    <div class="header-title">Quiz Management System</div>
    <a href="logout.jsp" class="logout-btn">
        <i class="fa-solid fa-right-from-bracket"></i> Sign Out
    </a>
</div>


<div class="main">

    <div class="card-grid">

      
        <div class="menu-card">
            <i class="fa-solid fa-list-check"></i>
            <h3>View Quizzes</h3>
            <form method="post" action="showQuiz.jsp">
                <input type="submit" value="View Quizzes"/>
            </form>
        </div>

     
        <div class="menu-card">
            <i class="fa-solid fa-chart-column"></i>
            <h3>View Scores</h3>
            <form method="post" action="viewScore.jsp">
                <input type="submit" value="View Scores"/>
            </form>
        </div>

    </div>

</div>

</body>
</html>
