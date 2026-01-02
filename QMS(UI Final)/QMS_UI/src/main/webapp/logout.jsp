<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<title>Log Out </title>


<link href="https://fonts.googleapis.com/css2?family=Inter:wght@400;500;600;700&display=swap" rel="stylesheet">

<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.5.0/css/all.min.css">

<style>
    body {
        margin: 0;
        font-family: 'Inter', -apple-system, BlinkMacSystemFont, 'Segoe UI', sans-serif;
        background: #FAF5FF;
        display: flex;
        justify-content: center;
        align-items: center;
        height: 100vh;
        color: #1F2937;
    }

    .logout-card {
        background: #FFFFFF;
        border-radius: 12px;
        padding: 2rem 3rem;
        text-align: center;
        box-shadow: 0 10px 25px rgba(124, 58, 237, 0.15);
        max-width: 400px;
        width: 100%;
    }

    .logout-card h3 {
        font-size: 1.5rem;
        margin-bottom: 1.5rem;
        color: #7C3AED;
    }

    .logout-card a {
        display: inline-block;
        background: linear-gradient(90deg, #7C3AED, #8B5CF6);
        color: #FFF;
        padding: 0.75rem 1.5rem;
        border-radius: 8px;
        text-decoration: none;
        font-weight: 500;
        transition: all 0.25s cubic-bezier(0.4, 0, 0.2, 1);
    }

    .logout-card a:hover {
        transform: scale(1.05);
        box-shadow: 0 4px 15px rgba(124, 58, 237, 0.3);
    }
</style>
</head>
<body>
    <div class="logout-card">
        <h3><i class="fa-solid fa-right-from-bracket"></i> Thank you!</h3>
        <a href="index.jsp">Login Again</a>
        <% session.invalidate(); %>
    </div>
</body>
</html>
