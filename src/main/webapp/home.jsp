<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Arohi Developers - Real Estate</title>
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css">
    <script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"></script>
    
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.2/css/all.min.css">
    <style>
        /* Optimized CSS */
        :root {
            --primary: #fccc2b;
            --secondary: #3b82f6;
        }

        body {
            font-family: 'Poppins', sans-serif;
            overflow-x: hidden;
        }

        .navbar {
		    background: rgba(0, 0, 0, 0.8) !important; /* Black background */
		    box-shadow: 0 4px 6px rgba(0, 0, 0, 0.1);
		    backdrop-filter: blur(8px);
		    transition: background-color 0.3s ease-in-out;
		}
		
		.navbar .nav-link,
		.navbar .navbar-brand {
		    color: white !important; /* White text */
		}

        
		.navbar-brand img {
			height: 60px;
			width: 60px;
			border-radius: 20%; /* Circular shape */
			border: 0px solid white; /* White border around the image */
			padding: 1px; /* Space between image and border */
			background-color: white; /* Ensures the background inside the border */
			object-fit: contain; /* Ensures the full image is visible */
		}
		
		/* Change navbar toggler icon to white */
		.navbar-light .navbar-toggler-icon {
			filter: invert(1);
		}

        .nav-link {
            font-size: 1.1rem;
            position: relative;
        }

        .nav-link::after {
            content: '';
            position: absolute;
            width: 0;
            height: 2px;
            background: var(--primary);
            bottom: 0;
            left: 0;
            transition: 0.3s;
        }

        .nav-link:hover::after {
            width: 100%;
        }

        #hero {
            background: url('arohi1.png') center/cover;
            min-height: 100vh;
            position: relative;
            margin-top: 55px;
        }

        @media (max-width: 768px) {
            #hero {
                background: url('bg2.png') center/cover;
                min-height: 70vh;
                margin-top: 50px;
            }
            
            .stat-box {
                width: 100% !important;
                margin: 10px 0 !important;
            }
            
           
        }
        
        #projects-section {
		    margin-top: 150px;  /* Increase top margin */
		    margin-bottom: 10px; /* Reduce bottom margin */
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

        .stats-container {
            display: grid;
            grid-template-columns: repeat(auto-fit, minmax(200px, 1fr));
            gap: 20px;
            padding: 20px;
        }

        .stat-box {
            background: rgba(255,255,255,0.95);
            border: 2px solid var(--primary);
            border-radius: 12px;
            padding: 25px;
            transition: 0.3s;
        }

        .stat-box:hover {
            transform: translateY(-5px);
            box-shadow: 0 8px 20px rgba(0,0,0,0.1);
        }

        .testimonials {
            width: 80%;
            border-color: var(--primary);
            background: rgba(255,255,255,0.95);
        }

        .carousel-control-prev-icon,
        .carousel-control-next-icon {
            background-color: var(--primary);
            padding: 15px;
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
       

        #contact {
            background: rgba(255,255,255,0.95);
            border-radius: 15px;
            box-shadow: 0 8px 30px rgba(0,0,0,0.1);
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
		
		.whatsapp-float:hover {
			background-color: #1ebe57;
		}
		        

        .footer {
            background: rgba(0,0,0,0.9);
            padding: 30px 0;
        }

        .progress-line {
            transform-origin: left;
            animation: progressLine linear;
            animation-timeline: scroll();
        }

        @keyframes progressLine {
            to { transform: scaleX(1); }
        }

        /* About Section Enhancements */
        .about-content {
            background: rgba(255,255,255,0.95);
            border-radius: 15px;
            padding: 40px;
            box-shadow: 0 8px 30px rgba(0,0,0,0.1);
        }

        .about-text p {
            font-size: 1.05rem;
            line-height: 1.8;
        }
    </style>
</head>
<body>
    <!-- Navigation -->
    <nav class="navbar navbar-expand-lg navbar-light fixed-top">
        <div class="container">
            <!-- <a class="navbar-brand" href="#">
                <img src="logo.png" alt="Logo">
            </a> -->
            <button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#navbarNav">
                <span class="navbar-toggler-icon"></span>
            </button>
            <div class="collapse navbar-collapse" id="navbarNav">
                <ul class="navbar-nav ms-auto">
                    <li class="nav-item mx-3">
					    <a class="nav-link" href="#hero" data-bs-toggle="collapse" data-bs-target=".navbar-collapse.show">home</a>
					</li>
					<li class="nav-item mx-3">
					    <a class="nav-link" href="#sales" data-bs-toggle="collapse" data-bs-target=".navbar-collapse.show">Sales</a>
					</li>
					<li class="nav-item mx-3">
					    <a class="nav-link" href="#projects-section" data-bs-toggle="collapse" data-bs-target=".navbar-collapse.show">Projects</a>
					</li>
					<li class="nav-item mx-3">
						<a class="nav-link" href="http://wa.me/+919665555079?text=Hi" target="_blank"  data-bs-target=".navbar-collapse.show">Chat</a>
						</li>
					<li class="nav-item mx-3">
					    <a class="nav-link" href="#contact" data-bs-toggle="collapse" data-bs-target=".navbar-collapse.show">Contact</a>
					</li>

                </ul>
            </div>
        </div>
    </nav>

    <!-- Hero Section -->
    <section id="hero" class="d-flex align-items-center">
        <div class="container text-center">
            <p class="my-4 text-light fs-4">
								From Vision To Reality ,<br> We Build With Precision And
								Passion .
							</p>
            
        </div>
    </section>
    
    

	<!-- About Section -->
<section id="about" class="about section-padding bm-5">
    <div class="container">
        <div class="row justify-content-center">
            <div class="col-lg-10 col-xl-8">
                <div class="about-content">
                    <h2 class="fw-bold mb-5 display-5 text-center text-dark">About Us</h2>
                    
                    <div class="about-text text-secondary" style="line-height: 1.8;">
                        <p class="lead mb-4 text-center text-muted">
                            Greetings of the day&hellip;!!!
                        </p>

                        <p class="mb-4">
                            Aarohi Developers is a trusted name in the field of real estate and land development in Pune, 
                            with the experience of last two decades. Aarohi Developers, an ISO 9001:2008 certified company, 
                            developed acres of land with a passion to make the dream of owning land property come true 
                            for thousands of people.
                        </p>

                        <p class="mb-4">
                            Our team of dedicated professionals has prolific experience in Land acquisition, land development, 
                            plotting, construction and real estate. The projects are located in strategic locations with plush 
                            amenities and options like Residential, NA plots, Farmhouse plots and Villas. We have unique 
                            opportunities in form of steadily growing investments along with complete peace of mind for 
                            a lifetime. We have established the unique culture of trust &amp; transparency.
                        </p>

                        <p class="mb-0">
                            In today's market, there are many investment options available on a large scale, but on comparing, 
                            the profit margin is significantly greater in land investment compared to other investment options. 
                            We ensure safe and secure investment opportunities while handling all legal documentation 
                            for our clients without any hassle.
                        </p>
                    </div>
                </div>
            </div>
        </div>
    </div>
</section>
		<!--  About Section end -->
		
		  <!-- Location Container -->
		  <div class="projects-section" id="projects-section">
    <h2 class="text-center my-5 display-4 fw-bold">Our Projects</h2>
     <section class="locations py-5" id="locations-container">
        <div class="container">
            <div class="col-12 text-center">
                    <div class="spinner-border text-primary" role="status">
                        <span class="visually-hidden">Loading...</span>
                    </div>
                </div>
            <div class="row g-4 justify-content-center" id="locations-grid">
                <!-- Locations will be loaded here dynamically -->
            </div>
        </div>
    </section>
    </div>
    
   
    
    
    <div class="container my-5">
        <div class="row g-4 justify-content-center">
            <div class="col-6 col-md-3">
                <div class="stat-box text-center p-3 rounded-3 shadow-sm">
                    <i class="fas fa-smile fs-4 text-primary"></i>
                    <div id="happyCustomers" class="stat-number">500+</div>
				<div class="stat-label">Happy Customers</div>
                </div>
            </div>
            <div class="col-6 col-md-3">
                <div class="stat-box text-center p-3 rounded-3 shadow-sm">
                    <i class="fas fa-spinner fs-4 text-primary"></i>
                    <div id="inProgressProjects" class="stat-number">8</div>
				<div class="stat-label">In-Progress Projects</div>
                </div>
            </div>
            <div class="col-6 col-md-3">
                <div class="stat-box text-center p-3 rounded-3 shadow-sm">
                    <i class="fas fa-check-circle fs-4 text-primary"></i>
                    <div class="stat-number mt-2">100+</div>
                    <div class="stat-label">Completed Projects</div>
                </div>
            </div>
            <div class="col-6 col-md-3">
                <div class="stat-box text-center p-3 rounded-3 shadow-sm">
                    <i class="fas fa-building fs-4 text-primary"></i>
                    <div class="stat-number mt-2">50+</div>
                    <div class="stat-label">Amenities Available</div>
                </div>
            </div>
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
						<p>"A great investment! The staff is super helpful and friendly." - Deepak B.</p>
					</div>
					<div class="carousel-item">
						<p>"Highly recommended! Excellent facilities." - Priya S.</p>
					</div>
				</div>
				<!-- Previous Button -->
<button class="carousel-control-prev" type="button" data-bs-target="#testimonialCarousel" data-bs-slide="prev">
    <span class="carousel-control-prev-icon" aria-hidden="true"></span>
    <span class="visually-hidden">Previous</span>
</button>

<!-- Next Button -->
<button class="carousel-control-next" type="button" data-bs-target="#testimonialCarousel" data-bs-slide="next">
    <span class="carousel-control-next-icon" aria-hidden="true"></span>
    <span class="visually-hidden">Next</span>
</button>

			</div>
		</section>
		
		
		
			<!-- Location Container -->
   
    

		<div style="display: flex; justify-content: center; margin-top: 20px;">
			<iframe
				src="https://www.google.com/maps/embed?pb=!1m18!1m12!1m3!1d1890.932351101027!2d73.74332559077928!3d18.580137494386523!2m3!1f0!2f0!3f0!3m2!1i1024!2i768!4f13.1!3m3!1m2!1s0x3bc2bbdd03ffa995%3A0x99608456ee91e26!2sAarohi%20Developers%20%26%20Promoters%20Pvt.%20Ltd.!5e0!3m2!1sen!2sin!4v1739680868633!5m2!1sen!2sin"
				width="600" height="450" style="border: 2px solid #fccc2b"
				allowfullscreen="" loading="lazy"
				referrerpolicy="no-referrer-when-downgrade"> </iframe>
		</div>   




	





		<section id="contact" class="py-5 bg-light">
        <div class="container">
            <div class="row justify-content-center">
                <div class="col-lg-6">
                    <div class="card border-warning shadow-lg">
                        <div class="card-body p-4">
                            <h2 class="card-title text-center mb-4">Enquiry Form</h2>
                            <form id="enquiryForm">
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
                                <button type="submit" class="btn btn-warning w-100 py-2 fw-bold">
                                    Submit Enquiry
                                </button>
                            </form>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </section>

		<a href="http://wa.me/+919665555079?text=Hi Arohi Developers"
			class="whatsapp-float" target="_blank"> <i
			class="fab fa-whatsapp"></i>
		</a>


	</main>
	<!-- main content end -->			

    <!-- Main Content (Keep existing content structure) -->
    <!-- Add all your existing sections here (About, Projects, Stats, etc) -->
    <!-- Ensure they use the improved CSS classes from above -->

   <!-- Footer -->
<footer class="footer">
    <div class="container text-center">
        <div class="contact-info text-white mb-4">
            <h5 class="mb-4">Aarohi Developers & Landmarks LLP</h5>
            <p class="mb-2">Address: 101, Raigad Building, Shivaji Chowk,<br>
            Hinjawadi Phase 2 Rd, Hinjawadi,<br>
            Hinjewadi, Maharashtra 411057</p>
            <p class="mb-2">Phone: <a href="tel:9175991177" class="text-white">9175991177</a></p>
            <p class="mb-2">Email: <a href="mailto:sales@aarohidevelopers.com" class="text-white">sales@aarohidevelopers.com</a></p>
            <p class="mb-3">Website: <a href="https://www.aarohidevelopers.com" class="text-white" target="_blank">www.aarohidevelopers.com</a></p>
        </div>
        <p class="text-white mb-3">&copy; 2024 Aarohi Developers. All rights reserved.</p>
        <div class="social-icons">
            <a href="#" class="text-white mx-3"><i class="fab fa-facebook fa-lg"></i></a>
            <a href="#" class="text-white mx-3"><i class="fab fa-instagram fa-lg"></i></a>
            <a href="#" class="text-white mx-3"><i class="fab fa-linkedin fa-lg"></i></a>
        </div>
    </div>
</footer>

    <!-- WhatsApp Float -->
    <a href="http://wa.me/+919665555079?text=Hi Arohi Developers"
			class="whatsapp-float" target="_blank"> <i
			class="fab fa-whatsapp"></i>
		</a>

    <!-- Existing JavaScript -->
 <jsp:include page="url.jsp" />   
    <script>
        // Add smooth scrolling
        document.querySelectorAll('a[href^="#"]').forEach(anchor => {
            anchor.addEventListener('click', function (e) {
                e.preventDefault();
                document.querySelector(this.getAttribute('href')).scrollIntoView({
                    behavior: 'smooth'
                });
            });
        });

        // Navbar scroll effect
        window.addEventListener('scroll', function() {
            if (window.scrollY > 100) {
                document.querySelector('.navbar').style.backgroundColor = 'rgba(0,0,0,0.95)';
            } else {
                document.querySelector('.navbar').style.backgroundColor = 'rgba(0,0,0,0.8)';
            }
        });
        
        
        
        $(document).ready(function() {
            // Fetch locations and display images
            $.ajax({
                url: prod_url + "/api/location/all", // Adjust URL as per backend
                type: "GET",
                success: function(response) {
                    let locationsContainer = $("#locations-container");
                    locationsContainer.empty(); // Clear existing data
                    console.log("API Response:", response);
                    
                    let data = Array.isArray(response) ? response : response.locations; // Ensure it's an array
                    if (!Array.isArray(data)) {
                        console.error("Unexpected API response format:", response);
                        return;
                    }

                    data.forEach(function(location) {
                        let imageSrc = location.image 
                            ? 'data:image/jpeg;base64,' + location.image
                            : "default-placeholder.jpg"; // Fallback image
                        let locationCard = '<img src="' + imageSrc + '" alt="Site Photo">';
                        locationsContainer.append(locationCard);
                    });
                },
                error: function() {
                    alert("Error fetching photos");
                }
            });

            // Fetch statistics
            $.ajax({
                url: prod_url + "/api/stats/getDetails",
                type: "GET",
                success: function(data) {
                    $("#happyCustomers").text(data.happyCustomers + "+");
                    $("#inProgressProjects").text(data.inProgressProjects);
                },
                error: function() {
                    $("#happyCustomers").text("Error");
                    $("#inProgressProjects").text("Error");
                }
            });

            // Handle enquiry form submission
            $('#enquiryForm').submit(function(event) {
                event.preventDefault(); // Prevent default form submission
                $('.spinner-container').show();

                // Get form data
                var formData = {
                    name: $('input[name="name"]').val(),
                    email: $('input[name="email"]').val(),
                    mobile: $('input[name="mobile"]').val(),
                    message: $('textarea[name="message"]').val()
                };

                // Send data via AJAX
                $.ajax({
                    type: "POST",
                    url: prod_url + "/api/enquiries/save",
                    contentType: "application/json",
                    data: JSON.stringify(formData),
                    success: function(response) {
                        $('.spinner-container').hide();
                        alert(response); // Show success message
                        $('#enquiryForm')[0].reset(); // Reset form after submission
                    },
                    error: function(xhr, status, error) {
                        alert("Error: " + xhr.responseText); // Show error message
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