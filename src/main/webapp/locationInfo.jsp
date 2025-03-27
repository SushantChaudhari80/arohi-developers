<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Location Info</title>
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0/css/all.min.css">
    
<link rel="stylesheet"
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css">
<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
<script
	src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"></script>
<link rel="stylesheet"
	href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.2/css/all.min.css">
    
   <style>
    /* Google Fonts */
    @import url('https://fonts.googleapis.com/css2?family=Poppins:wght@300;400;500;600&display=swap');
    
    * {
        margin: 0;
        padding: 0;
        box-sizing: border-box;
        font-family: 'Poppins', sans-serif;
    }

    body {
        background: linear-gradient(135deg, #f5f7fa 0%, #c3cfe2 100%);
        min-height: 100vh;
        padding: 2rem;
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
    

    h1 {
        text-align: center;
        color: #2c3e50;
        margin-bottom: 2rem;
        font-size: 2.5rem;
        text-shadow: 2px 2px 4px rgba(0,0,0,0.1);
    }

    #location-details {
        max-width: 1200px;
        margin: 0 auto;
    }

    .location-card {
        background: white;
        border-radius: 15px;
        box-shadow: 0 10px 30px rgba(0,0,0,0.1);
        display: flex;
        gap: 2rem;
        padding: 2rem;
        transition: transform 0.3s ease;
        margin-bottom: 2rem;
    }

    .location-card:hover {
        transform: translateY(-5px);
    }

   .location-card img {
    width: 40%;
    height: 300px;
    object-fit: contain; /* Ensure the full image is visible */
    background-color: white; /* Add white space for small images */
    border-radius: 10px;
    box-shadow: 0 4px 15px rgba(0,0,0,0.1);
}


    .location-info {
        flex: 1;
        display: flex;
        flex-direction: column;
        gap: 1rem;
    }

    .location-info h2 {
        color: #3498db;
        font-size: 2rem;
        margin-bottom: 0.5rem;
    }

    .location-info p {
        color: #666;
        line-height: 1.6;
        margin-bottom: 1rem;
    }

    .amenities {
        display: grid;
        grid-template-columns: repeat(auto-fit, minmax(200px, 1fr));
        gap: 1rem;
        margin: 1rem 0;
    }

    .amenities span {
        display: flex;
        align-items: center;
        gap: 0.5rem;
        color: #2c3e50;
        background: #f8f9fa;
        padding: 0.8rem;
        border-radius: 8px;
        transition: all 0.3s ease;
    }

    .amenities span:hover {
        background: #e9ecef;
        transform: translateX(5px);
    }

    .amenities i {
        color: #3498db;
        font-size: 1.1rem;
    }

    .view-map {
        align-self: flex-start;
        background: #3498db;
        color: white !important;
        padding: 0.8rem 1.5rem;
        border-radius: 25px;
        text-decoration: none;
        display: inline-flex;
        align-items: center;
        gap: 0.5rem;
        transition: all 0.3s ease;
        margin-top: auto;
    }

    .view-map:hover {
        background: #2980b9;
        transform: translateY(-2px);
        box-shadow: 0 5px 15px rgba(52,152,219,0.3);
    }

    .view-map i {
        color: white;
    }

    .error {
        color: #e74c3c !important;
        background: #fdeded;
        padding: 1rem;
        border-radius: 8px;
        border: 1px solid #f5c6cb;
        text-align: center;
        margin: 2rem 0;
    }

    @media (max-width: 768px) {
        .location-card {
            flex-direction: column;
            padding: 1.5rem;
        }

        .location-card img {
            width: 100%;
            height: 200px;
        }

        h1 {
            font-size: 2rem;
        }

        .location-info h2 {
            font-size: 1.5rem;
        }

        .amenities {
            grid-template-columns: 1fr;
        }
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
						href="#locations-container">Our Project</a></li>
					<li class="nav-item me-3"><a class="nav-link"
						href="http://wa.me/+919665555079?text=Hi" target="_blank">Chat</a></li>
					<li class="nav-item me-3"><a class="nav-link" href="#contact">Enquiry</a></li>
				</ul>
			</div>
		</div>
	</nav>

    <h1>Location Information</h1>
    <div id="location-details">
        <p>Loading location information...</p>
    </div>

    <script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
    <script>
        function getQueryParameter(name) {
            const urlParams = new URLSearchParams(window.location.search);
            return urlParams.get(name);
        }

        $(document).ready(function() {
            const siteNameParam = getQueryParameter('siteName');
            const siteName = siteNameParam ? decodeURIComponent(siteNameParam) : null;
            const prod_url = "http://localhost:8084"; // Update with your actual backend URL

            if (!siteName) {
                $('#location-details').html('<p class="error">No site name provided in URL parameters.</p>');
                return;
            }

            $.ajax({
                url: prod_url + "/api/location/all",
                type: "GET",
                success: function(response) {
                    console.log("API Response:", response);
                    const data = Array.isArray(response) ? response : (response.locations || []);
                    
                    const location = data.find(function(loc) {
                        return loc.siteName === siteName;
                    });
                    
                    if (location) {
                        const address = location.address || "Address not available";
                        const mapLink = location.mapLink || "#";
                        let facilitiesHtml = "";

                        if (location.facilities) {
                            facilitiesHtml = location.facilities.split(',')
                                .map(function(facility) {
                                    return '<span><i class="fa-solid fa-check"></i> ' + facility.trim() + '</span>';
                                })
                                .join('');
                        }

                        const imageSrc = location.image 
                            ? 'data:image/jpeg;base64,' + location.image
                            : 'https://via.placeholder.com/300x200?text=No+Image';

                        const html = [
                            '<div class="location-card">',
                                '<img src="' + imageSrc + '" alt="' + siteName + '">',
                                '<div class="location-info">',
                                    '<h2>' + siteName + '</h2>',
                                    '<p>' + address + '</p>',
                                    (facilitiesHtml ? '<div class="amenities">' + facilitiesHtml + '</div>' : ''),
                                    '<a href="' + mapLink + '" target="_blank" class="view-map">',
                                        'View on Map <i class="fa-solid fa-map-location-dot"></i>',
                                    '</a>',
                                '</div>',
                            '</div>'
                        ].join('');

                        $('#location-details').html(html);
                    } else {
                        $('#location-details').html('<p class="error">Location "' + siteName + '" not found.</p>');
                    }
                },
                error: function(xhr) {
                    console.error("Error loading locations:", xhr.responseText);
                    $('#location-details').html('<p class="error">Failed to load location details. Please try again later.</p>');
                }
            });
        });
    </script>
</body>
</html>