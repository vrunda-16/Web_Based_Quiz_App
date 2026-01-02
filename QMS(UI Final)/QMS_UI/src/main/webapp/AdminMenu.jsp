<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Admin Menu</title>


<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.5.0/css/all.min.css"/>


<link href="https://fonts.googleapis.com/css2?family=Inter:wght@400;500;600;700&display=swap" rel="stylesheet">

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

    --shadow-soft: 0 4px 20px rgba(124, 58, 237, 0.10);
    --shadow-medium: 0 10px 25px rgba(124, 58, 237, 0.15);
}

* {
    box-sizing: border-box;
    font-family: 'Inter', sans-serif;
}

body {
    margin: 0;
    background: var(--bg-light);
    color: var(--text-primary);
}


.header {
    position: sticky;
    top: 0;
    z-index: 100;
    background: linear-gradient(135deg, var(--violet-main), var(--violet-light));
    padding: 1rem 2rem;
    display: flex;
    align-items: center;
    justify-content: space-between;
    box-shadow: var(--shadow-medium);
}

.app-title {
    font-size: 1.6rem;
    font-weight: 700;
    color: white;
}

.signout-btn {
    text-decoration: none;
    color: white;
    font-weight: 500;
    padding: 0.5rem 1rem;
    border-radius: 8px;
    border: 1px solid rgba(255,255,255,0.4);
    transition: all 0.25s ease;
}

.signout-btn i {
    margin-right: 6px;
}

.signout-btn:hover {
    background: rgba(255,255,255,0.15);
}


.main-container {
    max-width: 1100px;
    margin: 0 auto;
    padding: 0 1.5rem;

  
    min-height: calc(100vh - 90px);
    display: flex;
    flex-direction: column;
    justify-content: center;
}


.card-grid {
    display: grid;
    grid-template-columns: repeat(auto-fit, minmax(260px, 1fr));
    gap: 2rem;
    text-align: center;
}


.menu-card {
    background: var(--white);
    border-radius: 12px;
    padding: 2rem 1.5rem;
    border: 1px solid var(--violet-accent);
    box-shadow: var(--shadow-soft);
    transition: all 0.25s ease;
}

.menu-card:hover {
    transform: scale(1.03);
    box-shadow: var(--shadow-medium);
}

.menu-card i {
    font-size: 2.5rem;
    color: var(--violet-main);
    margin-bottom: 1rem;
}

.menu-card h3 {
    margin: 0.5rem 0 1.2rem;
    font-size: 1.2rem;
    font-weight: 600;
}


.menu-card input[type="submit"] {
    background: linear-gradient(135deg, var(--violet-main), var(--violet-light));
    color: white;
    border: none;
    padding: 0.7rem 1.5rem;
    border-radius: 8px;
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
    <div class="app-title">Quiz Management System</div>
    <a href="logout.jsp" class="signout-btn">
        <i class="fa-solid fa-right-from-bracket"></i> Sign Out
    </a>
</div>


<div class="main-container">

    <div class="card-grid">

      
        <div class="menu-card">
            <i class="fa-solid fa-circle-plus"></i>
            <h3>Create Quiz</h3>
            <form method="post" action="createQuizForm.jsp">
                <input type="submit" value="Create Quiz"/>
            </form>
        </div>

       
        <div class="menu-card">
            <i class="fa-solid fa-list-check"></i>
            <h3>List Quizzes</h3>
            <form method="post" action="listQuizAdmin.jsp">
                <input type="submit" value="List Quizzes"/>
            </form>
        </div>

       
        <div class="menu-card">
            <i class="fa-solid fa-chart-column"></i>
            <h3>View Score</h3>
            <form method="post" action="viewScoreAdmin.jsp">
                <input type="submit" value="View Score"/>
            </form>
        </div>

    </div>
</div>

</body>
</html>
