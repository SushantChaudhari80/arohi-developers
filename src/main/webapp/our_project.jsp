<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Construction Projects</title>
    <link rel="stylesheet" href="styles.css">
    <script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
    
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
        .form-container {
            width: 50%;
            margin: 20px auto;
            padding: 20px;
            background: #fff;
            box-shadow: 0px 0px 10px rgba(0, 0, 0, 0.1);
            border-radius: 10px;
            text-align: left;
        }
        .form-container label {
            font-weight: bold;
        }
        .form-container input, .form-container textarea, .form-container select {
            width: 100%;
            padding: 10px;
            margin: 10px 0;
            border: 1px solid #ccc;
            border-radius: 5px;
        }
        .form-container button {
            background: #28a745;
            color: white;
            padding: 10px 15px;
            border: none;
            cursor: pointer;
        }
        .form-container button:hover {
            background: #218838;
        }
		.video-bg {
				          position: fixed;
				          top: 0;
				          left: 0;
				          width: 100%;
				          height: 100%;
				          object-fit: cover;
				          z-index: -1;
				      }
    </style>
</head>
<body>
	<video class="video-bg" autoplay loop muted playsinline>
	      <source src="bgv.mp4" type="video/mp4">
	      Your browser does not support the video tag.
	  </video>
    <nav class="navbar">
        <div class="container">
            <a href="#" class="logo">Arohi Developers Hinjewadi</a>
         </div>
    </nav>

   

    <section id="sites" class="projects">
        <div class="container">
            <div class="project-grid">
                <!-- Projects will be dynamically inserted here -->
            </div>
        </div>
    </section>

    <script>
        $(document).ready(function() {
            function loadProjects() {
                $.ajax({
                    url: "/api/projects/all",
                    type: "GET",
                    success: function(projects) {
                        let projectGrid = $(".project-grid");
                        projectGrid.html(""); // Clear existing projects

                        projects.forEach(function(project) {
                            let imgSrc = project.image ? "data:image/jpeg;base64," + project.image : "placeholder.jpg";
                            let projectCard = "<div class='project-card'>" +
                                "<img src='" + imgSrc + "' alt='" + project.type + "'>" +
                                "<div class='project-info'>" +
                                "<h3>" + project.type + "</h3>" +
                                "<p>" + project.description + "</p>" +
                                "</div>" +
                                "</div>";
                            projectGrid.append(projectCard);
                        });
                    },
                    error: function(xhr) {
                        console.error("Error fetching projects:", xhr.responseText);
                    }
                });
            }

            loadProjects(); // Load projects when page loads

          
        });
    </script>
</body>
</html>
