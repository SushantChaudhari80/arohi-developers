<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>Arohi Developers - Real Estate</title>

<link rel="stylesheet"
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css">
<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
<script
	src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"></script>
<link rel="stylesheet"
	href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.2/css/all.min.css">

<style>
.spinner-container {
	display: none; /* Hidden by default; show it when needed */
	position: fixed;
	top: 0;
	left: 0;
	width: 100%;
	height: 100%;
	background: rgba(0, 0, 0, 0.5); /* Semi-transparent background */
	backdrop-filter: blur(5px); /* Blur effect */
	z-index: 999; /* Above other elements */
	justify-content: center; /* Center spinner horizontally */
	align-items: center; /* Center spinner vertically */
}

.spinner {
	position: fixed;
	z-index: 999;
	top: left: 0;
	width: 100%;
	height: 100%;
	background: rgba(0, 0, 0, 0.5); /* Semi-transparent background */
	backdrop-filter: blur(5px); /* Blur effect */
	z-index: 999; /* Above other elements */
	justify-content: center; /* Center spinner horizontally */
	align-items: center; /* Center spinner vertically */
}

.spinner {
	position: fixed;
	z-index: 999;
	top: 50%;
	left: 50%;
	transform: translate(-50%, -50%);
	border: 5px solid #f3f3f3;
	border-top: 5px solid #3498db;
	border-radius: 50%;
	width: 30px;
	height: 30px;
	animation: spin 1s linear infinite;
}

@
keyframes spin { 0% {
	transform: rotate(0deg);
}

100
%
{
transform
:
rotate(
360deg
);
}
}
}
body {
	font-family: 'Poppins', sans-serif;
	background-color: #f8f9fa;
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

#hero {
    background: url('arohi1.png') no-repeat center top;
    background-size: cover;
    min-height: calc(100vh - 80px);
    padding-top: 80px;
    padding-bottom: 0;
    margin-bottom: 0;
}

/* Change background image for mobile screens */
@media (max-width: 576px) {
    #hero {
        background: url('bg2.png') no-repeat center top;
        background-size: cover;
    }
    
    .hero-banner-content {
        text-align: center;
    }

    .btn {
        font-size: 1rem;
        padding: 10px 20px;
    }
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

.stats-container {
	display: flex;
	flex-wrap: wrap;
	justify-content: center;
	gap: 20px;
	max-width: 900px;
	margin: 40px auto;
}

.stat-box, .facility-box {
	background: rgba(255, 255, 255, 0.9);
	margin-bottom: 10px;
	margin-left: 10px;
	padding: 20px;
	border-radius: 10px;
	box-shadow: 0 4px 6px rgba(0, 0, 0, 0.1);
	text-align: center;
	transition: transform 0.3s ease-in-out;
}

.stat-box:hover, .facility-box:hover {
	/*transform: translateY(-5px);*/
	background: rgba(255, 255, 255, 1);
	color: #ff5733 !important; /* Orange hover effect */
	transform: scale(1.15); /* Increased zoom effect */
	transition: transform 0.3s ease-in-out, color 0.3s ease-in-out;
}

.stat-box i, .facility-box i {
	font-size: 30px;
	color: #007BFF;
	margin-bottom: 10px;
}

/* Modified block start */
.facilities {
	text-align: center;
	padding: 50px 0;
}

.facility-box {
	background: rgba(255, 255, 255, 0.9);
	padding: 15px;
	border-radius: 10px;
	font-size: 18px;
	font-weight: bold;
	display: flex;
	align-items: center;
	justify-content: center;
	gap: 10px;
	height: 80px;
	box-shadow: 2px 2px 10px rgba(0, 0, 0, 0.2);
	flex: 1 1 calc(33.333% - 20px); /* Adjusts width dynamically */
	max-width: 30%; /* Prevents items from stretching too much */
	min-width: 250px; /* Ensures usability on small screens */
	text-align: center;
	border: 2px solid #fccc2b; /* Border color */
	transition: transform 0.3s ease-in-out, border-color 0.3s ease-in-out;
}

.facility-box:hover {
	transform: scale(1.05);
	border-color: #ff5733; /* Hover border color */
	        width: 100vw; /* Ensure it spans full viewport width */
	display: flex;
}

/* Icon Styling */
.facility-box i {
	font-size: 24px;
	color: #007bff;
}

#facilities {
	display: flex;
	flex-wrap: wrap;
	justify-content: center; /* Centering content */
	gap: 20px; /* Adds spacing between boxes */
}

/* Responsive Design */
@media ( max-width : 992px) { /* Tablet View */
	.facility-box {
		flex: 1 1 calc(50% - 20px); /* Two items per row */
		max-width: 45%;
	}
}

@media ( max-width : 576px) { /* Mobile View */
	.facility-box {
		flex: 1 1 100%; /* Full width on small screens */
		max-width: 100%;
	}
}
/* end */
.footer {
	background-color: rgba(0, 0, 0, 0.4) !important;
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

.whatsapp-float {
	position: fixed;
	bottom: 20px;
	right: 20px;
	background: #25D366;
	color: white;
	padding: 15px;
	border-radius: 50%;
	font-size: 24px;
	box-shadow: 2px 2px 10px rgba(0, 0, 0, 0.3);
	text-align: center;
	text-decoration: none;
}

.testimonials {
	width: 70%;
	border: 2px solid #fccc2b;
	padding: 50px 0;
	text-align: center;
	margin: 0 auto; /* Centers the section horizontally */
	border-radius: 10px; /* Optional: Adds rounded corners */
	box-shadow: 2px 2px 10px rgba(0, 0, 0, 0.1);
	/* Optional: Adds a soft shadow */
}

.whatsapp-float {
	position: fixed;
	bottom: 20px;
	right: 20px;
	background-color: #25D366;
	color: white;
	width: 50px;
	height: 50px;
	border-radius: 50%;
	display: flex;
	justify-content: center;
	align-items: center;
	font-size: 24px;
	box-shadow: 2px 2px 10px rgba(0, 0, 0, 0.3);
	text-decoration: none;
}

.whatsapp-float:hover {
	background-color: #1ebe57;
}

.banner_section {
	width: 100%;
	height: auto;
	margin-bottom: 10px;
}

.banner_section img {
	width: 100%;
	height: auto;
}

img {
	max-width: 100%;
}

.hero-img {
	
}

textarea {
	min-height: 100px !important;
}

.poligon {
	clip-path: polygon(25% 0%, 75% 0%, 100% 50%, 75% 100%, 25% 100%, 0% 50%);
}

.shape-left {
	clip-path: polygon(100% 0%, 75% 50%, 100% 100%, 25% 100%, 0% 50%, 25% 0%);
}

.octagon {
	clip-path: polygon(50% 0, 100% 17%, 100% 46%, 100% 70%, 100% 100%, 48% 90%, 0 100%,
		0 16%);
}

.progress-line {
	transform-origin: left;
	z-index: 9999;
	scale: 0 1;
	animation-name: progressLine;
	animation-timing-function: linear;
	animation-timeline: scroll();
}

.section-padding {
	padding: 90px 0;
}

#projectTab li button.active {
	color: yellow !important;
	background-color: #121212 !important;
}

@
keyframes progressLine {to { scale:11;
	
}

}
.btn-outline-warning {
	border-width: 3px; /* Adjust the thickness as needed */
}

.carousel-control-prev-icon, .carousel-control-next-icon {
	background-color: #fccc2b; /* Change background color */
	border-radius: 50%; /* Optional: Makes it circular */
	width: 50px; /* Adjust size as needed */
	height: 50px;
	display: flex;
	align-items: center;
	justify-content: center;
}

#enquiryForm {
	border: 2px solid #fccc2b;
	padding: 20px; /* Adjust as needed */
}

.form-container {
	background-color: rgba(0, 0, 0, 0.1); /* Black with transparency */
	padding: 20px; /* Add padding */
	border-radius: 8px; /* Optional: rounded corners */
}

.form-label, .form-control, .btn {
	color: black; /* Text color */
}

.form-control {
	background-color: weight; /* Make input fields transparent */
	border: 1px solid black; /* Optional: border color */
}

.form-control::placeholder {
	color: black; /* Placeholder text color */
	opacity: 0.8; /* Slightly transparent placeholder */
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
    width: 100%;  /* Ensure it fills the container width */
    height: 200px; /* Set a fixed height */
    object-fit: contain; /* Ensure the entire image fits without cropping */
    background-color: #f8f8f8; /* Adds a white/grayish background for padding effect */
    padding: 10px; /* Optional: Adds space around the image */
}

        .location-info {
            padding: 15px;
            text-align: center;
        }
       
        
</style>
<script src="https://kit.fontawesome.com/a076d05399.js"
	crossorigin="anonymous">
	
</script>
</head>
<body>

	<nav class="navbar navbar-expand-lg navbar-light">
		<div class="container">
			<a class="navbar-brand" href="#"> <img src="logo.png"
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
						href="#locations-container">Our Project</a></li>
					<li class="nav-item me-3"><a class="nav-link"
						href="http://wa.me/+919665555079?text=Hi" target="_blank">Chat</a></li>
					<li class="nav-item me-3"><a class="nav-link" href="#contact">Enquiry</a></li>
				</ul>
			</div>
		</div>
	</nav>





	<!-- main content -->
	<main class="main">
		<!--  hero section  -->
		<div id="hero" class="hero-banner section-padding img-fluid">
			<div class="container">
				<div class="row align-items-center gy-5">
					<div class="col-md-6">
						<div class="hero-banner-content">
							<h1 class="text-uppercase fw-bold text-warning">
								<br> <br> <br>
								<br>
								<br>
								<br>
							</h1>
							<p class="my-4 text-light fs-4">
								From Vision To Reality ,<br> We Build With Precision And
								Passion .
							</p>
							<button
								class="btn btn-warning fw-semibold text-light py-2 px-4 text-uppercase">
								<a class="nav-link" href="catlog.pdf">Download
									Catalog</a>
							</button>
						</div>
					</div>
				</div>
			</div>
		</div>
		<!-- hero section end -->


		<!--  About Section  -->
		<section id="about" class="about section-padding">
			<div class="container">
				<div class="row gx-5">
					<div class="col-md-6">
						<div class="about-content">
							<h2 class="fw-bold mb-4 display-6">About Us</h2>
							<p class="text-secondary">
								Greetings of the day !!!<br> Aarohi Developers is a trusted
								name in the field of real estate and land development in Pune,
								with the experience of last two decades. Aarohi Developers, an
								ISO 9001:2008 certified company, developed acres of land with a
								passion to make the dream of owning land property come true for
								thousands of people. Our team of dedicated professionals has
								prolific experience in Land acquisition, land development,
								plotting, construction and real estate. The projects are located
								in strategic locations with plush amenities and options like
								Residential, NA plots, Farmhouse plots and Villas. We have
								unique opportunities in form of steadily growing investments
								along with complete peace of mind for a lifetime. We have
								established the unique culture of trust & transparency In
								today’s market, there are many investment options available on a
								large scale, but on comparing, the profit margin is very greater
								in land investment, than the other investment options. We ensure
								the safe and secure investment opportunities as well as take
								care and complete the legal documentation, with no hassle to our
								client.
							</p>
						</div>
					</div>
					<div class="col-md-6">
						<img class="shape-left text-right" src="posterbg2.png" alt=""
							onclick="window.location.href='our_project.jsp';"
							style="cursor: pointer;">

					</div>
				</div>
			</div>
		</section>
		<!--  About Section end -->


		<div class="stats-container">
			<div
				class="stat-box text-center btn btn-outline-warning text-dark shadow">
				<i class="fas fa-smile"></i>
				<div id="happyCustomers" class="stat-number">500+</div>
				<div class="stat-label">Happy Customers</div>
			</div>
			<div
				class="stat-box text-center btn btn-outline-warning text-dark shadow">
				<i class="fas fa-spinner"></i>
				<div id="inProgressProjects" class="stat-number">8</div>
				<div class="stat-label">In-Progress Projects</div>
			</div>
			<div
				class="stat-box text-center btn btn-outline-warning text-dark shadow">
				<i class="fas fa-check-circle"></i>
				<div class="stat-number">100+</div>
				<div class="stat-label">Completed Projects</div>
			</div>
			<div
				class="stat-box text-center btn btn-outline-warning text-dark shadow">
				<i class="fas fa-building"></i>
				<div class="stat-number">50+</div>
				<div class="stat-label">Amenities Available</div>
			</div>
		</div>
		<section class="testimonials">
			<h2>What Our Clients Say</h2>
			<div id="testimonialCarousel" class="carousel slide"
				data-bs-ride="carousel">
				<div class="carousel-inner">
					<div class="carousel-item active">
						<p>"Best investment ever! The location is amazing." - Rahul M.</p>
					</div>
					<div class="carousel-item">
						<p>"Highly recommended! Excellent facilities." - Priya S.</p>
					</div>
				</div>
				<a class="carousel-control-prev" href="#testimonialCarousel"
					data-bs-slide="prev"> <span class="carousel-control-prev-icon"></span>
				</a> <a class="carousel-control-next" href="#testimonialCarousel"
					data-bs-slide="next"> <span class="carousel-control-next-icon"></span>
				</a>
			</div>
		</section>
		
		
		
			<!-- Location Container -->
   
    <section class="locations" id="locations-container">
        <!-- Locations will be loaded here dynamically -->
    </section>
 

		<div style="display: flex; justify-content: center; margin-top: 20px;">
			<iframe
				src="https://www.google.com/maps/embed?pb=!1m18!1m12!1m3!1d1890.932351101027!2d73.74332559077928!3d18.580137494386523!2m3!1f0!2f0!3f0!3m2!1i1024!2i768!4f13.1!3m3!1m2!1s0x3bc2bbdd03ffa995%3A0x99608456ee91e26!2sAarohi%20Developers%20%26%20Promoters%20Pvt.%20Ltd.!5e0!3m2!1sen!2sin!4v1739680868633!5m2!1sen!2sin"
				width="600" height="450" style="border: 2px solid #fccc2b"
				allowfullscreen="" loading="lazy"
				referrerpolicy="no-referrer-when-downgrade"> </iframe>
		</div>   




	





		<section id="contact"
			class="container flex items-center justify-center min-h-screen bg-gray-200 mt-5">
			<div
				class="relative p-8 rounded-lg shadow-lg max-w-md w-full border border-gray-400">
				<form id="enquiryForm" class="form-container">
					<h2 class="text-center text-2xl font-bold mb-6">Enquiry Form</h2>
					<div class="mb-4">
						<label class="form-label block mb-2">Name</label> <input
							type="text"
							class="form-control w-full p-2 border border-gray-400 rounded"
							name="name" placeholder="Enter your name" required>
					</div>
					<div class="mb-4">
						<label class="form-label block mb-2">Email</label> <input
							type="email"
							class="form-control w-full p-2 border border-gray-400 rounded"
							name="email" placeholder="Enter your email" required>
					</div>
					<div class="mb-4">
						<label class="form-label block mb-2">Mobile</label> <input
							type="text"
							class="form-control w-full p-2 border border-gray-400 rounded"
							name="mobile" pattern="[0-9]{10}"
							placeholder="Enter your mobile number" required>
					</div>
					<div class="mb-4">
						<label class="form-label block mb-2">Message</label>
						<textarea
							class="form-control w-full p-2 border border-gray-400 rounded"
							name="message" rows="3" placeholder="Enter your message" required></textarea>
					</div>
					<div
						style="display: flex; justify-content: center; align-items: center;">
						<button type="submit"
							style="border: 2px solid #fccc2b; background-color: #3b82f6; color: white; width: 150px; padding: 6px 0; border-radius: 4px; transition: background-color 0.3s; font-size: 14px; cursor: pointer;"
							onmouseover="this.style.backgroundColor='#2563eb'"
							onmouseout="this.style.backgroundColor='#3b82f6'">
							Submit</button>
					</div>
				</form>
			</div>
		</section>

		<a href="http://wa.me/+919665555079?text=Hi Arohi Developers"
			class="whatsapp-float" target="_blank"> <i
			class="fab fa-whatsapp"></i>
		</a>

	</main>
	<!-- main content end -->

	<footer class="footer">
		<p>&copy; 2025 Arohi Developers. All rights reserved.</p>
		<div class="social-icons">
			<a href="#"><i class="fab fa-facebook"></i></a> <a href="#"><i
				class="fab fa-instagram"></i></a> <a href="#"><i
				class="fab fa-youtube"></i></a> <a href="#"><i
				class="fab fa-linkedin"></i></a>
		</div>
	</footer>
	<jsp:include page="url.jsp" />
	<script>
		$(document)
				.ready(
						function() {
							$
									.ajax({
										url : prod_url + "/api/location/all", // Adjust URL as per backend
										type : "GET",
										success : function(response) {
											let locationsContainer = $("#locations-container");
											locationsContainer.empty(); // Clear existing data
											console.log("API Response:",
													response);
											let data = Array.isArray(response) ? response
													: response.locations; // Ensure it's an array
											if (!Array.isArray(data)) {
												console
														.error(
																"Unexpected API response format:",
																response);
												return;
											}

											data
													.forEach(function(location) {

														let imageSrc = location.image ? 'data:image/jpeg;base64,'
																+ location.image
																: "default-placeholder.jpg"; // Fallback image
														let locationCard = '<img src="' + imageSrc + '" alt="Site Photo">';
														locationsContainer
																.append(locationCard);
													});

										},
										error : function() {
											alert("Error fetching photos");
										}
									});
							$.ajax({
								url : prod_url + "/api/stats/getDetails",
								type : "GET",
								success : function(data) {
									$("#happyCustomers").text(
											data.happyCustomers + "+");
									$("#inProgressProjects").text(
											data.inProgressProjects);
								},
								error : function() {
									$("#happyCustomers").text("Error");
									$("#inProgressProjects").text("Error");
								}
							});
							$('#enquiryForm')
									.submit(
											function(event) {
												event.preventDefault(); // Prevent default form submission
												$('.spinner-container').show();
												// Get form data
												var formData = {
													name : $(
															'input[name="name"]')
															.val(),
													email : $(
															'input[name="email"]')
															.val(),
													mobile : $(
															'input[name="mobile"]')
															.val(),
													message : $(
															'textarea[name="message"]')
															.val()
												};

												// Send data via AJAX
												$
														.ajax({
															type : "POST",
															url : prod_url
																	+ "/api/enquiries/save",
															contentType : "application/json",
															data : JSON
																	.stringify(formData),
															success : function(
																	response) {
																$(
																		'.spinner-container')
																		.hide();
																alert(response); // Show success message
																$('#enquiryForm')[0]
																		.reset(); // Reset form after submission
															},
															error : function(
																	xhr,
																	status,
																	error) {
																alert("Error: "
																		+ xhr.responseText); // Show error message
															}
														});
											});
						});
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		$(document).ready(function() {
		    function loadLocations() {
		        $.ajax({
		            url: prod_url + "/api/location/all", // Adjust URL as per backend
		            type: "GET",
		            success: function(response) {
		                console.log("API Response:", response);
		                let data = Array.isArray(response) ? response : response.locations; // Ensure it's an array
		                
		                if (!Array.isArray(data)) {
		                    console.error("Unexpected API response format:", response);
		                    return;
		                }

		                let locationsContainer = $("#locations-container");
		                locationsContainer.empty(); // Clear existing data

		                data.forEach(function(location) {
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
		                        '<div class="location-card" onclick="openLocationInfo(\'' + siteName + '\')">' +
		                            '<img src="' + imageSrc + '" alt="' + siteName + '">' +
		                        '</div>';

		                    locationsContainer.append(locationCard);
		                });
		            },
		            error: function(xhr) {
		                console.error("Error loading locations:", xhr.responseText);
		                alert("Failed to load locations. Please try again later.");
		            }
		        });
		    }

		    // Define the openLocationInfo function in the global scope
		    window.openLocationInfo = function(siteName) {
		        // Redirect to locationInfo.jsp with the siteName as a query parameter
		        window.location.href = 'locationInfo.jsp?siteName=' + encodeURIComponent(siteName);
		    };

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
