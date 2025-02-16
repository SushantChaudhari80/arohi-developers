<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Transport Dashboard</title>
    <link href="https://fonts.googleapis.com/css2?family=Poppins:wght@300;400;500;600&display=swap" rel="stylesheet">
    <style>
	
        * {
            margin: 0;
            padding: 0;
            box-sizing: border-box;
        }
        
        body, html {
            font-family: 'Poppins', sans-serif;
            height: 100%;
            background-image: url('img/bk6.jpg');
        }
        
        /* Basic Layout */
        .dashboard-container {
            display: flex;
            height: 100vh;
        }

        /* Sidebar */
		.sidebar {
		    height: 100%;
		    width: 250px;
		    background-color: #2C3E50;
		    color: white;
		    display: flex;
		    flex-direction: column;
		    justify-content: space-between;
		    padding: 20px;
		    box-sizing: border-box; /* Ensures padding doesn't increase the size of the sidebar */
		    overflow-y: auto; /* Adds a scrollbar if content exceeds the height */
		}


        .sidebar h2 {
            font-size: 24px;
            font-weight: 500;
            color: #ecf0f1;
            margin-bottom: 20px;
        }
		* {
		           margin: 0;
		           padding: 0;
		           box-sizing: border-box;
		       }

		       body, html {
		           font-family: 'Poppins', sans-serif;
		           height: 100%;
		           background-image: url('img/bk6.jpg');
		       }

		       .dashboard-container {
		           display: flex;
		           height: 100vh;
		       }

		       /* Sidebar */
		       .sidebar {
		           height: 100%;
		           width: 250px;
		           background-color: #2C3E50;
		           color: white;
		           display: flex;
		           flex-direction: column;
		           justify-content: space-between;
		           padding: 20px;
		           box-sizing: border-box;
		           overflow-y: auto;
		           transition: transform 0.3s ease;
		       }

		       .sidebar.hidden {
		           transform: translateX(-100%);
		       }

		       .sidebar h2 {
		           font-size: 24px;
		           font-weight: 500;
		           color: #ecf0f1;
		           margin-bottom: 20px;
		       }

		       .nav-links {
		           list-style: none;
		       }

		       .nav-links li {
		           margin-bottom: 20px;
		       }

		       .nav-links li a {
		           text-decoration: none;
		           color: #bdc3c7;
		           font-size: 16px;
		           display: flex;
		           align-items: center;
		       }

		       .nav-links li a:hover {
		           color: #ecf0f1;
		       }

		       .footer {
		           text-align: center;
		           font-size: 14px;
		           color: #bdc3c7;
		       }

		       /* Sidebar Toggle Button */
		       .sidebar-toggle {
		           position: absolute;
		           top: 20px;
		           left: 20px;
		           background-color: #2980b9;
		           color: white;
		           border: none;
		           padding: 10px 15px;
		           border-radius: 4px;
		           cursor: pointer;
		           z-index: 1000;
		       }

		       .sidebar-toggle:hover {
		           background-color: #3498db;
		       }

		       /* Main Content */
		       .main-content {
		           flex: 1;
		           padding: 20px;
		       }

		       .main-content h1 {
		           font-size: 28px;
		           font-weight: 500;
		           margin-bottom: 20px;
		           color: white;
		       }

		       .overview {
		           display: grid;
		           grid-template-columns: repeat(auto-fit, minmax(250px, 1fr));
		           gap: 20px;
		       }

		       .card {
		           background-color: white;
		           border-radius: 8px;
		           box-shadow: 0 2px 10px rgba(0, 0, 0, 0.1);
		           padding: 2px;
		           text-align: center;
		       }

		       .card h3 {
		           font-size: 22px;
		           margin-bottom: 10px;
		       }

		       .card p {
		           font-size: 18px;
		           color: #7f8c8d;
		       }

		       /* Responsive Design */
		       @media (max-width: 768px) {
		           .dashboard-container {
		               flex-direction: column;
		           }

		           .sidebar {
		               position: absolute;
		               z-index: 100;
		               height: 100%;
		           }

		           .main-content {
		               padding: 10px;
		           }
		       }

        .nav-links {
            list-style: none;
        }

        .nav-links li {
            margin-bottom: 20px;
        }

        .nav-links li a {
            text-decoration: none;
            color: #bdc3c7;
            font-size: 16px;
            display: flex;
            align-items: center;
        }

        .nav-links li a:hover {
            color: #ecf0f1;
        }

        /* Header */
        .header {
            width: 100%;
            height: 50px;
            background-color: #fff;
            display: flex;
            justify-content: space-between;
            align-items: center;
            padding: 0 10px;
            border-bottom: 2px solid #ddd;
        }

        .header .search-bar input {
            padding: 10px;
            width: 250px;
            border-radius: 4px;
            border: 1px solid #ddd;
        }

        .header .user-section {
            display: flex;
            align-items: center;
        }

        .header .user-section img {
            width: 40px;
            height: 40px;
            border-radius: 50%;
            margin-left: 15px;
        }

        /* Main Content */
        .main-content {
            width: 100%;
            padding: 20px;
        }

        .main-content h1 {
            font-size: 28px;
            font-weight: 500;
            margin-bottom: 20px;
        }

        /* Overview Section */
        .overview {
            display: grid;
            grid-template-columns: repeat(auto-fit, minmax(250px, 1fr));
            gap: 20px;
        }

        .card {
            background-color: white;
            border-radius: 8px;
            box-shadow: 0 2px 10px rgba(0, 0, 0, 0.1);
            padding: 2px;
            text-align: center;
        }

        .card h3 {
            font-size: 22px;
            margin-bottom: 10px;
        }

        .card p {
            font-size: 18px;
            color: #7f8c8d;
        }

        /* Orders Table */
        .orders-section {
            margin-top: 30px;
        }

        .orders-section h2 {
            font-size: 24px;
            margin-bottom: 20px;
        }

        table {
            width: 100%;
            border-collapse: collapse;
        }

        table thead {
            background-color: #2980b9;
            color: white;
        }

        table th, table td {
            padding: 12px;
            text-align: left;
            border: 1px solid #ddd;
        }

        table tbody tr:nth-child(even) {
            background-color: #f2f2f2;
        }

        /* Responsive Design */
        @media (max-width: 768px) {
            .dashboard-container {
                flex-direction: column;
            }

            .sidebar {
                width: 100%;
                height: auto;
                display: flex;
                flex-direction: row;
                justify-content: space-between;
            }

            .main-content {
                padding: 10px;
            }
			
        }
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

							@keyframes spin {
							    0% { transform: rotate(0deg); }
							    100% { transform: rotate(360deg); }
							}
		.modal {
		    display: none; /* Hidden by default */
		    position: fixed;
		    z-index: 1000;
		    left: 0;
		    top: 0;
		    width: 100%;
		    height: 100%;
		    overflow: auto;
		    background-color: rgba(0, 0, 0, 0.5); /* Black background with opacity */
		}

		.modal-content {
		    background-color: #fefefe;
		    margin: 15% auto;
		    padding: 20px;
		    border: 1px solid #888;
		    width: 80%;
		    max-width: 500px;
		    border-radius: 10px;
		}

		.close-btn {
		    color: #aaa;
		    float: right;
		    font-size: 28px;
		    font-weight: bold;
		    cursor: pointer;
		}

		.close-btn:hover,
		.close-btn:focus {
		    color: black;
		    text-decoration: none;
		    cursor: pointer;
		}
		.submenu {
		            list-style: none;
		            padding-left: 20px;
		            display: none;
		            
		        }

		        .submenu li {
		            padding: 8px;
					margin-bottom:10px;
		           }

		        .toggle-btn {
		            float: right;
		        }
    </style>
    
		<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
		<jsp:include page="url.jsp" />
		<script>
		    $(document).ready(function() {
				$('.spinner-container').show();
				$('#sidebar').hide();
				$('.spinner-container').show();
				$('#menubtn').on('click', function () {
				    $('#sidebar').fadeIn(); // Toggles with a sliding effect closeSideBar
					$('#menubtn').hide();
				});
				$('#closeSideBar').on('click', function () {
					 $('#sidebar').fadeOut(); // Toggles with a sliding effect closeSideBar
					 $('#menubtn').show();
				});
				$.ajax({
					                url: prod_url+'/api/customers/dashboard/utilitis',  // URL for fetching the customer data
					                type: 'GET',
					                success: function(utils) {
					                   console.log(utils);
									   $("#totalOrders").text(utils.totalOrders);//vehicleCount
									   $("#vehicleCount").text(utils.totalVehicales);
									   $("#activeOrders").text(utils.activeOrders);//activeOrders
									   $("#pendingOrders").text(utils.pendingOrders);//completeOrders
									   $("#completeOrders").text(utils.completeOrders);
									   $("#billedTreeps").text(utils.billedTreeps);
									   $("#unbilledTreeps").text(utils.unbilledTreeps);
									   $("#diesel").text(utils.diesel + "(L)");
									   $("#totalDivers").text(utils.totalDivers);
									   $('.spinner-container').hide();
					                },
					                error: function(xhr, status, error) {
					                    console.error("Error fetching customer data:", error);
					                }
					            });
		        // Function to fetch customer data from server using AJAX
		        function fetchCustomerData() {
		            $.ajax({
		                url: prod_url+'/api/customers/get',  // URL for fetching the customer data
		                type: 'GET',
		                success: function(customer) {
		                    // Update the UI with the customer data
		                    $('#customer-name').text(customer.name);
		                    if (customer.picture) {
		                        var imageUrl = 'data:image/png;base64,' + customer.picture;
		                        $('#customer-picture').attr('src', imageUrl);
		                    }
							$('.spinner-container').hide();
		                },
		                error: function(xhr, status, error) {
		                    console.error("Error fetching customer data:", error);
							window.location.href="loginnew.jsp";
		                }
		            });
		        }
		
		        // Call the function to load customer data when the page is ready
		        fetchCustomerData();
				// Modal Elements
				   const modal = $('#user-info-modal');
				   const closeModal = $('.close-btn');

				   // Open modal on user-section click
				   $('.user-section').on('click', function () {
				       modal.show();
				       $('.spinner-container').show();
				       // Fetch user information
				       $.ajax({
				           url: prod_url+'/api/customers/get', // Adjust this endpoint as necessary
				           type: 'GET',
				           success: function (customer) {
				               // Populate modal fields
				               $('#user-mobile').text(customer.mobile || 'N/A');
				               $('#user-name').text(customer.name || 'N/A');
				               $('#user-business-name').text(customer.bussinessName || 'N/A');
				               $('#user-gst-no').text(customer.gstNo || 'N/A');
				               $('#user-ac-no').text(customer.acNo || 'N/A');
				               $('#user-ifsc').text(customer.ifsc || 'N/A');
				               $('#user-bank-name').text(customer.bankName || 'N/A');
				               $('#user-address').text(customer.address || 'N/A');
				               if (customer.picture) {
				                   const imgUrl = 'data:image/png;base64,' + customer.picture;
				                   $('#user-picture').attr('src', imgUrl);
				               } else {
				                   $('#user-picture').attr('src', 'https://via.placeholder.com/150');
				               }

				               // Hide spinner and show modal
				               $('.spinner-container').hide();
				               
				           },
				           error: function (xhr, status, error) {
				               console.error('Error fetching user data:', error);
				               alert('Failed to load user information.');
				               $('.spinner-container').hide();
				           },
				       });
				   });

				   // Close modal
				   closeModal.on('click', function () {
				       modal.hide();
				   });
				   
				   document.querySelectorAll(".toggle-btn").forEach(btn => {
				           btn.addEventListener("click", function () {
				               let submenu = this.parentElement.nextElementSibling;
				               if (submenu.style.display === "block") {
				                   submenu.style.display = "none";
				                   this.textContent = "+";
				               } else {
				                   submenu.style.display = "block";
				                   this.textContent = "-";
				               }
				           });
				       });
				   // Close modal when clicking outside
				   $(window).on('click', function (event) {
				       if ($(event.target).is(modal)) {
				           modal.hide();
				       }
				   });
		    });
	
		</script>
</head>
<body>
	<div class="spinner-container">
        <div class="spinner"></div>
	</div>
	<!-- User Info Modal -->
	<div id="user-info-modal" class="modal">
	    <div class="modal-content">
	        <span class="close-btn">&times;</span>
	        <h2>User Information</h2>
	        <div class="user-info">
	            <p><strong>Mobile:</strong> <span id="user-mobile"></span></p>
	            <p><strong>Name:</strong> <span id="user-name"></span></p>
	            <p><strong>Business Name:</strong> <span id="user-business-name"></span></p>
	            <p><strong>GST No:</strong> <span id="user-gst-no"></span></p>
	            <p><strong>Account No:</strong> <span id="user-ac-no"></span></p>
	            <p><strong>IFSC Code:</strong> <span id="user-ifsc"></span></p>
	            <p><strong>Bank Name:</strong> <span id="user-bank-name"></span></p>
	            <p><strong>Address:</strong> <span id="user-address"></span></p>
	            <img id="user-picture" src="https://via.placeholder.com/150" alt="User Picture" style="max-width: 100px;">
	        </div>
	    </div>
	</div>

   <div class="dashboard-container">
	   <div class="sidebar" id="sidebar">
	              <div>
					  <div style="display: flex; flex-direction: row; justify-content: space-between; align-items: center;">
		                  <h2>Transport</h2>
						  <span id="closeSideBar">&times;</span>
					  </div>
	                  <ul class="nav-links">
	                      <li><a href="dashboard.jsp">Dashboard</a></li>
	                      <li><a href="order.jsp">Orders</a></li>
						  <li>
						      <div style="display: flex; flex-direction: row; justify-content: space-between; align-items: center;">
						          <a href="vehicales.jsp">Vehicles</a>
						          <span class="toggle-btn">+</span>
						      </div>
						      <ul class="submenu" style="display: none;">
						          <li><a href="addVehicale.jsp">Add Vehicle</a></li>
						          <li><a href="reports.jsp">Vehicle Report</a></li>
						      </ul>
						  </li>
	                      <!--<li><a href="vehicales.jsp">Vehicles</a></li>-->
						  <li>
						  						      <div style="display: flex; flex-direction: row; justify-content: space-between; align-items: center;">
						  						          <a href="drivers.jsp">Drivers</a>
						  						          <span class="toggle-btn">+</span>
						  						      </div>
						  						      <ul class="submenu" style="display: none;">
						  						          <li><a href="addDriver.jsp">Add Driver</a></li>
						  						      </ul>
						  </li>						  						  

	                      <li><a href="quatationGenerator.jsp">Quotation</a></li>
	                      
						  
						  <li>
						  		<div style="display: flex; flex-direction: row; justify-content: space-between; align-items: center;">
						  			<a href="quotation.jsp">Generate Treep</a>
						  			<span class="toggle-btn">+</span>
						  		</div>
						  		<ul class="submenu" style="display: none;">
									<li><a href="dumper.jsp">UnBilled Treeps</a></li>
									<li><a href="billedTreep.jsp">Billed Treeps</a></li>
						  		</ul>
						  </li>
						  
						  <li>
						  		<div style="display: flex; flex-direction: row; justify-content: space-between; align-items: center;">
						  			<a href="">Machine Reading</a>
						  			<span class="toggle-btn">+</span>
						  		</div>
						  		<ul class="submenu" style="display: none;">
									<li><a href="orderReport.jsp">UnBilled Readings</a></li> 
									<li><a href="billedReadings.jsp">Billed Readings</a></li> 
						  		</ul>
						   </li>
						  
	                     
	                      
	                      <li><a href="dieselReport.jsp">Diesel Report</a></li>
	                      <li><a href="payments.jsp">Payments</a></li>
						  <li><a href="genralVouchers.jsp">General Vouchers</a></li>
	                      <li><a href="invoices.jsp">Invoices</a></li>
	                      <li><a href="incident.jsp">Incident/Support</a></li>
	                  </ul>
	              </div>
	              <div class="footer">
	                  <p>&copy; Tanvi Software Solution</p>
	              </div>
	    </div>

        <!-- Main Content -->
        <div class="main-content">
            <!-- Header -->
           
            <div class="header">
				
				<div style="display: flex;"> 
					<span id="menubtn" style="margin-right:10px;">&#9776;</span>
					
					<div class="search-bar">
						<input type="text" placeholder="Search...">
					</div>
				</div>
			    <div class="user-section">
			        <span id="customer-name">Loading....</span>
			        <img id="customer-picture" src="https://via.placeholder.com/40" alt="User Profile">
					<input type="button" id="logoutButton" value="Logout" onclick="window.location.href='loginnew.jsp';">
			    </div>
			</div>

            <!-- Overview Section -->
            <h1 style="color: white;">Dashboard Overview</h1>
            <div class="overview">
				<a href="order.jsp" class="card" style="text-decoration: none; color: inherit;">
				    <div>
				        <h3>Total Orders</h3>
				        <p id="totalOrders">000</p>
				    </div>
				</a>
				<a href="vehicales.jsp" class="card" style="text-decoration: none; color: inherit;">
	                <div class="card">
	                    <h3>Vehicles in Use</h3>
	                    <p  id="vehicleCount">000</p>
	                </div>
				</a>
				<a href="activeOrder.jsp" class="card" style="text-decoration: none; color: inherit;">
	                <div class="card">
	                    <h3>Active Deliveries</h3>
	                    <p id="activeOrders">000</p>
	                </div>
				</a>
				<a href="pendingOrder.jsp" class="card" style="text-decoration: none; color: inherit;">	
	                <div class="card">
	                    <h3>Pending Issues</h3>
	                    <p id="pendingOrders">000</p>
	                </div>
				</a>
				<a href="completeOrders.jsp" class="card" style="text-decoration: none; color: inherit;">
					<div class="card">
					   <h3>Complete Deliveries</h3>
					   <p id="completeOrders">000</p>
					</div>
				</a>
				<a href="billedTreep.jsp" class="card" style="text-decoration: none; color: inherit;">
					<div class="card">
					   <h3>Billed Treeps</h3>
					   <p id="billedTreeps">000</p>
					</div>
				</a>
				<a href="dumper.jsp" class="card" style="text-decoration: none; color: inherit;">	
					<div class="card">
						<h3>UnBilled Treeps</h3>
						<p id="unbilledTreeps">000</p>
					</div>
				</a>	
				<a href="dieselReport.jsp" class="card" style="text-decoration: none; color: inherit;">
					<div class="card">
						<h3>Diesel</h3>
						<p id="diesel">000</p>
					</div>
				</a>	
				<a href="drivers.jsp" class="card" style="text-decoration: none; color: inherit;">
					<div class="card">
						<h3>Drivers</h3>
						<p id="totalDivers">000</p>
					</div>
				</a>
            </div>

            <!-- Orders Section -->
            <div class="orders-section">
                
            </div>
        </div>
    </div>
</body>
</html>
