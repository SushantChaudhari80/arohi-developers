<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>Construction Projects</title>
<!-- Bootstrap CSS -->
<link rel="stylesheet"
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css">

<!-- FontAwesome -->
<link rel="stylesheet"
	href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.2/css/all.min.css">

<!-- jQuery -->
<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>

<style>
body {
	font-family: Arial, sans-serif;
	margin: 0;
	padding: 0;
	box-sizing: border-box;
}

.navbar {
	background-color: rgba(0, 0, 0, 0.8) !important; /* More transparency */
	box-shadow: 0 4px 6px rgba(0, 0, 0, 0.1);
	transition: background-color 0.3s ease-in-out;
	backdrop-filter: blur(8px); /* Adds a slight blur effect */
	margin-bo: 0; /* Remove top margin */
}

.navbar-brand img {
	height: 65px;
	width: 65px;
	border-radius: 20%; /* Circular shape */
	border: 0px solid white; /* White border around the image */
	padding: 1px; /* Space between image and border */
	background-color: white; /* Ensures the background inside the border */
	object-fit: contain; /* Ensures the full image is visible */
}

.navbar-light .navbar-nav .nav-link {
	color: white !important; /* White nav items */
	font-size: 1.4rem;
	font-weight: 500;
	transition: color 0.3s ease-in-out, transform 0.2s ease-in-out;
}

.navbar-light .navbar-nav .nav-link:hover {
	color: #ff5733 !important; /* Orange hover effect */
	transform: scale(1.15); /* Increased zoom effect */
	transition: transform 0.3s ease-in-out, color 0.3s ease-in-out;
}

/* Change navbar toggler icon to white */
.navbar-light .navbar-toggler-icon {
	filter: invert(1);
}

.hero {
	background:
		url('https://source.unsplash.com/1600x900/?architecture,building')
		no-repeat center center;
	background-size: cover;
	height: 90vh;
	display: flex;
	align-items: center;
	justify-content: center;
	color: #fff;
	font-weight: bold;
	top: 50%;
	color: rgba(255, 255, 255, 0.9); /* Faded background text */
	font-size: 3rem; /* Bigger size for background text */
	font-weight: 900;
	letter-spacing: 5px;
	text-shadow: 2px 2px 10px rgba(0, 0, 0, 0.2);
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

header {
	background-color: rgba(0, 0, 0, 0.2);
	color: #fff;
	padding: 20px;
	text-align: center;
	border-radius: 15px;
	/* Adjust the value as needed for more or less curvature */
	margin-top: 40px; /* Adjust the value for the desired top margin */
}

.projects {
	padding: 100px 0;
	text-align: center;
}

.project-grid {
	display: grid;
	grid-template-columns: repeat(auto-fit, minmax(300px, 1fr));
	/* This allows for responsive columns */
	gap: 20px; /* Space between the grid items */
	margin-top: 20px;
}

.project-card {
	background: #f4f4f4;
	border-radius: 10px;
	overflow: hidden;
	box-shadow: 0 4px 8px rgba(0, 0, 0, 0.1);
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

/* Optional: Ensure the parent container has enough width */
.project-grid {
	max-width: 1200px; /* Adjust as needed */
	margin: 0 auto; /* Center the grid */
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

.form-container input, .form-container textarea, .form-container select
	{
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



.footer {
	background-color: rgba(0, 0, 0, 0.4);
	color: white;
	text-align: center;
	padding: 20px 0;
	margin-top: 20px;
}

.footer .social-icons a {
	color: white;
	margin: 0 10px;
	font-size: 1.5rem;
	text-decoration: none;
}
</style>
</head>
<body>


	<nav class="navbar navbar-expand-lg navbar-light">
		<div class="container">
			<a class="navbar-brand" href="home.jsp"> <img src="logo.png"
				alt="Arohi Developers">
			</a>
			<button class="navbar-toggler" type="button"
				data-bs-toggle="collapse" data-bs-target="#navbarNav">
				<span class="navbar-toggler-icon"></span>
			</button>
			<div class="collapse navbar-collapse" id="navbarNav">
				<ul class="navbar-nav ms-auto">
					<li class="nav-item me-3"><a class="nav-link" href="#sales">Sales</a></li>
					<li class="nav-item me-3"><a class="nav-link"
						href="our_project.jsp">Our Project</a></li>
					<li class="nav-item me-3"><a class="nav-link"
						href="location.jsp">Locations</a></li>
					<li class="nav-item me-3"><a class="nav-link"
						href="http://wa.me/+919665555079?text=Hi" target="_blank">Chat</a></li>
					<li class="nav-item me-3"><a class="nav-link" href="#contact">Enquiry</a></li>
				</ul>
			</div>
		</div>
	</nav>


	<!-- <section class="banner_section">
		<img src="arohi_developer1.png" alt="Baner" class="hero-image" />
	</section> -->

	<!-- main content -->
	<main class="main">
		<!--  hero section  -->
		<div id="hero" class="hero-banner section-padding"
			style="background-image: url(posterbg1.png)">
			<div class="container">
				<div class="row align-items-center gy-5">
					<div class="col-md-6">
						<div class="hero-banner-content">
							<h1 class="text-uppercase fw-bold text-warning mt-5">
								Welcome <br>To <br>Arohi Developers
							</h1>
							<button
								class="btn btn-warning fw-semibold text-light py-2 px-4 text-uppercase">
								<a class="nav-link" href="RESUME_deepak_bharate.pdf">Download
									Catalog</a>
							</button>
						</div>
					</div>
				</div>

			</div>

			<header class="header">
				<h2>Our Projectss</h2>
			</header>
			<section id="sites" class="projects">
				<div class="container">
					<div class="project-grid">
						<!-- Projects will be dynamically inserted here -->
					</div>
				</div>
			</section>


		</div>

		<footer class="footer">
			<p>&copy; 2025 Arohi Developers. All rights reserved.</p>
			<div class="social-icons">
				<a href="#"><i class="fab fa-facebook"></i></a> <a href="#"><i
					class="fab fa-instagram"></i></a> <a href="#"><i
					class="fab fa-youtube"></i></a> <a href="#"><i
					class="fab fa-linkedin"></i></a>
			</div>
		</footer>
	</main>

	<jsp:include page="url.jsp" />
	<script>
		$(document)
				.ready(
						function() {
							function loadProjects() {
								$
										.ajax({
											url : prod_url
													+ "/api/projects/all",
											type : "GET",
											success : function(projects) {
												let projectGrid = $(".project-grid");
												projectGrid.html(""); // Clear existing projects

												projects
														.forEach(function(
																project) {
															let imgSrc = project.image ? "data:image/jpeg;base64,"
																	+ project.image
																	: "placeholder.jpg";
															let projectCard = "<div class='project-card'>"
																	+ "<img src='" + imgSrc + "' alt='" + project.type + "'>"
																	+ "<div class='project-info'>"
																	+ "<h3>"
																	+ project.type
																	+ "</h3>"
																	+ "<p>"
																	+ project.description
																	+ "</p>"
																	+ "</div>"
																	+ "</div>";
															projectGrid
																	.append(projectCard);
														});
											},
											error : function(xhr) {
												console
														.error(
																"Error fetching projects:",
																xhr.responseText);
											}
										});
							}

							loadProjects(); // Load projects when page loads

						});
	</script>
</body>
</html>
