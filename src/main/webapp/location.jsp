<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Locations Page</title>
    
    <!-- Bootstrap CSS -->
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css">

    <!-- FontAwesome -->
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.2/css/all.min.css">

    <!-- jQuery -->
    <script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>

    <style>
        body {
            font-family: Arial, sans-serif;
            margin: 0;
            padding: 0;
            background-color: #f4f4f4;
        }
        .navbar {
	background-color: rgba(0, 0, 0, 0.8) !important; /* More transparency */
	box-shadow: 0 4px 6px rgba(0, 0, 0, 0.1);
	transition: background-color 0.3s ease-in-out;
	backdrop-filter: blur(8px); /* Adds a slight blur effect */
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

        
        header {
            background-color: rgba(0, 0, 0, 0.2);
            color: #fff;
            padding: 20px;
            text-align: center;
                border-radius: 15px; /* Adjust the value as needed for more or less curvature */
                margin-top: 40px; /* Adjust the value for the desired top margin */
            
        }
        #search {
            width: 80%;
            padding: 10px;
            margin-top: 10px;
            border: none;
            border-radius: 5px;
            text-align: center;
        }
        .locations {
            display: flex;
            flex-wrap: wrap;
            justify-content: center;
            padding: 20px;
        }
        .location-card {
            background: #fff;
            margin: 15px;
            border-radius: 10px;
            overflow: hidden;
            box-shadow: 0 4px 8px rgba(0,0,0,0.1);
            width: 300px;
            transition: transform 0.3s;
        }
        .location-card:hover {
            transform: scale(1.05);
        }
        .location-card img {
            width: 100%;
            height: 200px;
            object-fit: cover;
        }
        .location-info {
            padding: 15px;
            text-align: center;
        }
        .amenities {
            display: flex;
            justify-content: center;
            gap: 10px;
            margin: 10px 0;
            flex-wrap: wrap;
        }
        .amenities span {
            background: #eee;
            padding: 5px 10px;
            border-radius: 5px;
            font-size: 14px;
        }
        .view-map {
            display: inline-block;
            margin-top: 10px;
            padding: 8px 15px;
            background: #007bff;
            color: #fff;
            text-decoration: none;
            border-radius: 5px;
            transition: background 0.3s;
        }
        .view-map:hover {
            background: #0056b3;
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

<nav class="navbar navbar-expand-lg navbar-light mb-5">
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
	<main class="main mb-5">
		<!--  hero section  -->
		<div id="hero" class="hero-banner section-padding"
			style="background-image: url(posterbg1.png)">
			<div class="container">
				<div class="row align-items-center gy-5">
					<div class="col-md-6">
						<div class="hero-banner-content">
							<h1 class="text-uppercase fw-bold text-warning">
								Welcome <br>To <br>Arohi Developers
							</h1>
							<p class="my-4 text-light fs-4">
								From Vision To Reality ,<br> We Build With Precision And
								Passion .
							</p>
							<button
								class="btn btn-warning fw-semibold text-light py-2 px-4 text-uppercase">
								<a class="nav-link" href="RESUME_deepak_bharate.pdf">Download
									Catalog</a>
							</button>
						</div>
					</div>
				</div>
			


 
    <header class="header">
    <h2>Explore Locations</h2>
    <input type="text" id="search" placeholder="Search locations...">
</header>
    
    <section class="locations" id="locations-container">
        <!-- Locations will be loaded here dynamically -->
    </section>
    </div>
		</div>

    <footer class="footer">
        <p>&copy; 2025 Arohi Developers. All rights reserved.</p>
        <div class="social-icons">
            <a href="#"><i class="fab fa-facebook"></i></a>
            <a href="#"><i class="fab fa-instagram"></i></a>
            <a href="#"><i class="fab fa-youtube"></i></a>
            <a href="#"><i class="fab fa-linkedin"></i></a>
        </div>
    </footer>
    </main>
		<!-- hero section end -->
	<jsp:include page="url.jsp" />
    <script>
        $(document).ready(function() {
			function loadLocations() {
			       $.ajax({
			           url: prod_url+"/api/location/all", // Adjust URL as per backend
			           type: "GET",
			           success: function (response) {
			               console.log("API Response:", response);
			               let data = Array.isArray(response) ? response : response.locations; // Ensure it's an array
			               
			               if (!Array.isArray(data)) {
			                   console.error("Unexpected API response format:", response);
			                   return;
			               }

			               let locationsContainer = $("#locations-container");
			               locationsContainer.empty(); // Clear existing data

			               data.forEach(function (location) {
			                   let siteName = location.siteName || "Unknown Location";
			                   let address = location.address || "Address not available";
			                   let mapLink = location.mapLink || "#";
			                   
							   let facilitiesHtml = "";
							   if (location.facilities) {
							       facilitiesHtml = location.facilities.split(',')
							           .map(function(facility) {
							               return '<span><i class="fa-solid fa-check"></i> ' + facility.trim() + '</span>';
							           })
							           .join('');
							   }

			                   // Decode Base64 image
							   let imageSrc = location.image 
							       ? 'data:image/jpeg;base64,' + location.image
							       : "default-placeholder.jpg"; // Fallback image

								   let locationCard = 
								       '<div class="location-card">' +
								           '<img src="' + imageSrc + '" alt="' + siteName + '">' +
								           '<div class="location-info">' +
								               '<h2>' + siteName + '</h2>' +
								               '<p>' + address + '</p>' +
								               '<div class="amenities">' + facilitiesHtml + '</div>' +
								               '<a href="' + mapLink + '" target="_blank" class="view-map">View on Map</a>' +
								           '</div>' +
								       '</div>';

			                   locationsContainer.append(locationCard);
			               });
			           },
			           error: function (xhr) {
			               console.error("Error loading locations:", xhr.responseText);
			               alert("Failed to load locations. Please try again later.");
			           }
			       });
			   }

			   loadLocations(); 

            $("#search").on("keyup", function() {
                let value = $(this).val().toLowerCase();
                $(".location-card").filter(function() {
                    $(this).toggle($(this).text().toLowerCase().indexOf(value) > -1);
                });
            });
        });
    </script>
</body>
</html>