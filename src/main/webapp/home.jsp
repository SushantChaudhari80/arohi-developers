<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Arohi Developers - Real Estate</title>
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css">
    <script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"></script>
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.2/css/all.min.css">

	
    <style>
		body {
		          font-family: Arial, sans-serif;
		      }
		      .navbar {
		          background-color: rgba(255, 255, 255, 0.9) !important;
		          box-shadow: 0 4px 6px rgba(0, 0, 0, 0.1);
		      }
		      .navbar-brand img {
		          height: 50px;
		          width: 50px;
		      }
		      .hero {
		          background: url('https://source.unsplash.com/1600x900/?architecture,building') no-repeat center center;
		          background-size: cover;
		          height: 70vh;
		          display: flex;
		          align-items: center;
		          justify-content: center;
		          color: white;
		          text-shadow: 2px 2px 10px rgba(0, 0, 0, 0.5);
		          font-size: 2rem;
		          font-weight: bold;
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
		          padding: 20px;
		          border-radius: 10px;
		          box-shadow: 0 4px 6px rgba(0, 0, 0, 0.1);
		          text-align: center;
		          transition: transform 0.3s ease-in-out;
		      }
		      .stat-box:hover, .facility-box:hover {
		          transform: translateY(-5px);
		          background: rgba(255, 255, 255, 1);
		      }
		      .stat-box i, .facility-box i {
		          font-size: 30px;
		          color: #007BFF;
		          margin-bottom: 10px;
		      }
		      .facilities {
		          padding: 50px 0;
		          text-align: center;
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
				margin:20%;
				  width:70%;
		          background: #f1f1f1;
		          padding: 50px 0;
		          text-align: center;
		      }
      
    </style>
	<script src="https://kit.fontawesome.com/a076d05399.js" crossorigin="anonymous"></script>
</head>
<body>
	<video class="video-bg" autoplay loop muted playsinline>
	      <source src="bgv.mp4" type="video/mp4">
	      Your browser does not support the video tag.
	  </video>
    <nav class="navbar navbar-expand-lg navbar-light">
        <div class="container">
            <a class="navbar-brand" href="#">
                <img src="logo.png" alt="Arohi Developers">
            </a>
            <button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#navbarNav">
                <span class="navbar-toggler-icon"></span>
            </button>
            <div class="collapse navbar-collapse" id="navbarNav">
                <ul class="navbar-nav ms-auto">
                    <li class="nav-item"><a class="nav-link" href="#sales">Sales</a></li>
                    <li class="nav-item"><a class="nav-link" href="our_project.jsp">Our Project</a></li>
                    <li class="nav-item"><a class="nav-link" href="location.jsp">Locations</a></li>
                    <li class="nav-item"><a class="nav-link" href="http://wa.me/+919665555079?text=Hi" target="_blank">Chat</a></li>
                    <li class="nav-item"><a class="nav-link" href="#contact">Enquiry</a></li>
                </ul>
            </div>
        </div>
    </nav>

    <div class="hero text-center">
        Welcome to Arohi Developers
    </div>
	
	<section class="facilities">
	        <h2 class="hero text-center">Our Facilities</h2>
	        <div class="container">
	            <div class="row">
					<div class="col-md-4 facility-box"><i class="fas fa-bolt"></i> 24/7 Electricity</div>
					<div class="col-md-4 facility-box"><i class="fas fa-road"></i> Proper Roads</div>
					<div class="col-md-4 facility-box"><i class="fas fa-water"></i> 24/7 Water Supply</div>
					<div class="col-md-4 facility-box"><i class="fas fa-video"></i> 24/7 CCTV Security</div>
					<div class="col-md-4 facility-box"><i class="fas fa-tree"></i> Green Parks</div>
					<div class="col-md-4 facility-box"><i class="fas fa-car"></i> Parking Space</div>
	            </div>
	        </div>
	</section>

    <div class="stats-container">
        <div class="stat-box"><i class="fas fa-smile"></i><div class="stat-number">500+</div><div class="stat-label">Happy Customers</div></div>
        <div class="stat-box"><i class="fas fa-spinner"></i><div class="stat-number">8</div><div class="stat-label">In-Progress Projects</div></div>
        <div class="stat-box"><i class="fas fa-check-circle"></i><div class="stat-number">20</div><div class="stat-label">Completed Projects</div></div>
        <div class="stat-box"><i class="fas fa-building"></i><div class="stat-number">50+</div><div class="stat-label">Amenities Available</div></div>
    </div>
	<section class="testimonials">
	      <h2>What Our Clients Say</h2>
	      <div id="testimonialCarousel" class="carousel slide" data-bs-ride="carousel">
	          <div class="carousel-inner">
	              <div class="carousel-item active">
	                  <p>"Best investment ever! The location is amazing." - Rahul M.</p>
	              </div>
	              <div class="carousel-item">
	                  <p>"Highly recommended! Excellent facilities." - Priya S.</p>
	              </div>
	          </div>
	          <a class="carousel-control-prev" href="#testimonialCarousel" data-bs-slide="prev">
	              <span class="carousel-control-prev-icon"></span>
	          </a>
	          <a class="carousel-control-next" href="#testimonialCarousel" data-bs-slide="next">
	              <span class="carousel-control-next-icon"></span>
	          </a>
	      </div>
	  </section>

    <section id="contact" class="container py-5 bg-light">
        <h2 class="text-center">Enquiry Form</h2>
        <form id="enquiryForm" class="form-container">
            <div class="mb-3"><label class="form-label">Name</label><input type="text" class="form-control" name="name" required></div>
            <div class="mb-3"><label class="form-label">Email</label><input type="email" class="form-control" name="email" required></div>
            <div class="mb-3"><label class="form-label">Mobile</label><input type="text" class="form-control" name="mobile" pattern="[0-9]{10}" required></div>
            <div class="mb-3"><label class="form-label">Message</label><textarea class="form-control" name="message" rows="3" required></textarea></div>
            <button type="submit" class="btn btn-primary w-100">Submit</button>
        </form>
    </section>
	
	<!--<iframe src="https://www.google.com/maps/embed?...https://maps.app.goo.gl/snccYs9aF9fDJTF48..." width="70%" height="350"></iframe>-->
	<iframe src="https://www.google.com/maps/embed?pb=!1m18!1m12!1m3!1d1890.932351101027!2d73.74332559077928!3d18.580137494386523!2m3!1f0!2f0!3f0!3m2!1i1024!2i768!4f13.1!3m3!1m2!1s0x3bc2bbdd03ffa995%3A0x99608456ee91e26!2sAarohi%20Developers%20%26%20Promoters%20Pvt.%20Ltd.!5e0!3m2!1sen!2sin!4v1739680868633!5m2!1sen!2sin" width="600" height="450" style="border:0;" allowfullscreen="" loading="lazy" referrerpolicy="no-referrer-when-downgrade"></iframe>

	    <a href="http://wa.me/+919665555079?text=Hi" class="whatsapp-float" target="_blank">
	        <i class="fab fa-whatsapp"></i>
	    </a>

    <footer class="footer">
        <p>&copy; 2025 Arohi Developers. All rights reserved.</p>
        <div class="social-icons">
            <a href="#"><i class="fab fa-facebook"></i></a>
            <a href="#"><i class="fab fa-instagram"></i></a>
            <a href="#"><i class="fab fa-youtube"></i></a>
            <a href="#"><i class="fab fa-linkedin"></i></a>
        </div>
    </footer>

    <script>
        $(document).ready(function () {
            $('#enquiryForm').submit(function (event) {
                event.preventDefault();
                alert('Form submitted successfully!');
            });
        });
    </script>
</body>
</html>
