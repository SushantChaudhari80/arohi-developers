<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Locations Page</title>
    <!-- Bootstrap JS (Popper.js is included) -->
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"></script>
    
    
    <!-- Bootstrap CSS -->
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css">

    <!-- FontAwesome -->
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.2/css/all.min.css">

    <!-- jQuery -->
    <script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>

    <style>

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
        
    </style>
</head>
<body>


	<!-- <section class="banner_section">
		<img src="arohi_developer1.png" alt="Baner" class="hero-image" />
	</section> -->

	<!-- main content -->
	


 

    
    <section class="locations" id="locations-container">
        <!-- Locations will be loaded here dynamically -->
    </section>
 

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