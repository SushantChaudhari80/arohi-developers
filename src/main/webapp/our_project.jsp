<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Construction Project</title>
    <link rel="stylesheet" href="styles.css">
    <style>
        body {
            font-family: Arial, sans-serif;
            margin: 0;
            padding: 0;
            box-sizing: border-box;
        }
        .navbar {
            background: #333;
            color: white;
            padding: 15px 0;
            position: fixed;
            width: 100%;
            top: 0;
            left: 0;
            z-index: 1000;
        }
        .container {
            width: 80%;
            margin: auto;
            display: flex;
            justify-content: space-between;
            align-items: center;
        }
        .logo {
            font-size: 24px;
            font-weight: bold;
            text-decoration: none;
            color: white;
        }
        .nav-links {
            list-style: none;
            display: flex;
            gap: 20px;
        }
        .nav-item .nav-link {
            color: white;
            text-decoration: none;
            font-size: 18px;
            transition: color 0.3s ease;
        }
        .nav-item .nav-link:hover {
            color: #f4a261;
        }
        .projects {
            padding: 100px 0;
            text-align: center;
        }
        .project-grid {
            display: grid;
            grid-template-columns: repeat(auto-fit, minmax(300px, 1fr));
            gap: 20px;
            margin-top: 20px;
        }
        .project-card {
            background: #f4f4f4;
            border-radius: 10px;
            overflow: hidden;
            box-shadow: 0 4px 8px rgba(0,0,0,0.1);
            transition: transform 0.3s ease;
        }
        .project-card:hover {
            transform: scale(1.05);
        }
        .project-card img {
            width: 100%;
            height: 200px;
            object-fit: cover;
        }
        .project-info {
            padding: 15px;
        }
        .project-info h3 {
            margin: 10px 0;
            font-size: 20px;
        }
        .project-info p {
            color: #666;
        }
    </style>
</head>
<body>
    <nav class="navbar">
        <div class="container">
            <a href="#" class="logo">Arohi Developers hinjewadi</a>
            <ul class="nav-links">
                <li class="nav-item"><a class="nav-link" href="#home">Home</a></li>
                <li class="nav-item"><a class="nav-link" href="#about">About</a></li>
                <li class="nav-item"><a class="nav-link" href="#services">Services</a></li>
                <li class="nav-item"><a class="nav-link" href="#sites">Our Projects</a></li>
                <li class="nav-item"><a class="nav-link" href="#contact">Contact</a></li>
            </ul>
        </div>
    </nav>
    
    <section id="sites" class="projects">
        <div class="container">
            <h2>Our Projects</h2>
            <div class="project-grid">
                <div class="project-card">
                    <img src="project1.jpg" alt="Project 1">
                    <div class="project-info">
                        <h3>Luxury Apartment</h3>
                        <p>High-end residential building with modern architecture.</p>
                    </div>
                </div>
                <div class="project-card">
                    <img src="project2.jpg" alt="Project 2">
                    <div class="project-info">
                        <h3>Corporate Tower</h3>
                        <p>State-of-the-art office spaces with sustainable design.</p>
                    </div>
                </div>
                <div class="project-card">
                    <img src="project3.jpg" alt="Project 3">
                    <div class="project-info">
                        <h3>Shopping Mall</h3>
                        <p>A commercial hub featuring international brands and food courts.</p>
                    </div>
                </div>
            </div>
        </div>
    </section>
</body>
</html>
