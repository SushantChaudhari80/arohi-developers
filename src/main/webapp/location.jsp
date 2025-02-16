<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Locations Page</title>
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.2/css/all.min.css">
	<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.2/css/all.min.css">
    <style>
        body {
            font-family: Arial, sans-serif;
            margin: 0;
            padding: 0;
            background-color: #f4f4f4;
        }
        header {
            background-color: rgba(0, 0, 0, 0.4) !important;
            color: #fff;
            padding: 20px;
            text-align: center;
        }
        #search {
            width: 80%;
            padding: 10px;
            margin-top: 10px;
            border: none;
            border-radius: 5px;
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
				           object-fit: cover; /* Ensures the video covers the entire screen */
				           z-index: -1; /* Places the video behind other content */
				       }
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
    </style>
</head>
<body>
	<video class="video-bg" autoplay loop muted playsinline>
	      <source src="bgv.mp4" type="video/mp4">
	      Your browser does not support the video tag.
	  </video>
    <header>
        <h1>Explore Locations</h1>
        <input type="text" id="search" placeholder="Search locations...">
    </header>
    
    <section class="locations">
        <div class="location-card">
            <img src="loc1.jfif" alt="Location 1">
            <div class="location-info">
                <h2>Arohi Developers</h2>
                <p>Hinjewadi , pune</p>
                <div class="amenities">
                    <span><i class="fa-solid fa-wifi"></i> WiFi</span>
                    <span><i class="fa-solid fa-car"></i> Parking</span>
                    <span><i class="fa-solid fa-mug-hot"></i> Cafe</span>
                </div>
                <a href="https://maps.google.com" target="_blank" class="view-map">View on Map</a>
            </div>
        </div>
        
        <div class="location-card">
            <img src="loc2.jfif" alt="Location 2">
            <div class="location-info">
                <h2>Arohi Developers site 2</h2>
                <p>Baner , Pune</p>
                <div class="amenities">
                    <span><i class="fa-solid fa-swimming-pool"></i> Pool</span>
                    <span><i class="fa-solid fa-sun"></i> Beach View</span>
                    <span><i class="fa-solid fa-utensils"></i> Restaurant</span>
                </div>
                <a href="https://maps.google.com" target="_blank" class="view-map">View on Map</a>
            </div>
        </div>
		<div class="location-card">
		         <img src="loc2.jfif" alt="Location 2">
		         <div class="location-info">
		             <h2>Arohi Developers site 2</h2>
		             <p>Baner , Pune</p>
		             <div class="amenities">
		                 <span><i class="fa-solid fa-swimming-pool"></i> Pool</span>
		                 <span><i class="fa-solid fa-sun"></i> Beach View</span>
		                 <span><i class="fa-solid fa-utensils"></i> Restaurant</span>
		             </div>
		             <a href="https://maps.google.com" target="_blank" class="view-map">View on Map</a>
		         </div>
		     </div>
			 <div class="location-card">
			          <img src="loc2.jfif" alt="Location 2">
			          <div class="location-info">
			              <h2>Arohi Developers site 2</h2>
			              <p>Baner , Pune</p>
			              <div class="amenities">
			                  <span><i class="fa-solid fa-swimming-pool"></i> Pool</span>
			                  <span><i class="fa-solid fa-sun"></i> Beach View</span>
			                  <span><i class="fa-solid fa-utensils"></i> Restaurant</span>
			              </div>
			              <a href="https://maps.google.com" target="_blank" class="view-map">View on Map</a>
			          </div>
			      </div>
				  <div class="location-card">
				           <img src="loc2.jfif" alt="Location 2">
				           <div class="location-info">
				               <h2>Arohi Developers site 2</h2>
				               <p>Baner , Pune</p>
				               <div class="amenities">
				                   <span><i class="fa-solid fa-swimming-pool"></i> Pool</span>
				                   <span><i class="fa-solid fa-sun"></i> Beach View</span>
				                   <span><i class="fa-solid fa-utensils"></i> Restaurant</span>
				               </div>
				               <a href="https://maps.google.com" target="_blank" class="view-map">View on Map</a>
				           </div>
				       </div>
					   <div class="location-card">
					            <img src="loc2.jfif" alt="Location 2">
					            <div class="location-info">
					                <h2>Arohi Developers site 2</h2>
					                <p>Baner , Pune</p>
					                <div class="amenities">
					                    <span><i class="fa-solid fa-swimming-pool"></i> Pool</span>
					                    <span><i class="fa-solid fa-sun"></i> Beach View</span>
					                    <span><i class="fa-solid fa-utensils"></i> Restaurant</span>
					                </div>
					                <a href="https://maps.google.com" target="_blank" class="view-map">View on Map</a>
					            </div>
					        </div>
    </section>
	<footer class="footer">
	       <p>&copy; 2025 Arohi Developers. All rights reserved.</p>
	       <div class="social-icons">
	           <a href="#"><i class="fab fa-facebook"></i></a>
	           <a href="#"><i class="fab fa-instagram"></i></a>
	           <a href="#"><i class="fab fa-youtube"></i></a>
	           <a href="#"><i class="fab fa-linkedin"></i></a>
	       </div>
	   </footer>
</body>
</html>
