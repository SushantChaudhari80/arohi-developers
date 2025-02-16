<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Transport Orders Page</title>
    <link href="https://fonts.googleapis.com/css2?family=Poppins:wght@300;400;500;600&display=swap" rel="stylesheet">
	<%@ page import="com.sushant.live.service.OrderService" %>
	<style>
        * {
            margin: 0;
            padding: 0;
            box-sizing: border-box;
        }

        body, html {
            font-family: 'Poppins', sans-serif;
            background-color: #f4f6f9;
        }

        /* Basic Layout */
        .container {
            max-width: 1200px;
            margin: 0 auto;
            padding: 20px;
        }

        /* Page Header */
        .page-header {
            display: flex;
            justify-content: space-between;
            align-items: center;
            margin-bottom: 30px;
        }

        .page-header h1 {
            font-size: 28px;
            font-weight: 500;
        }

        .btn {
            padding: 10px 20px;
            background-color: #2980b9;
            color: white;
            text-decoration: none;
            border-radius: 5px;
        }

        /* Filters Section */
        .filters {
            display: flex;
            justify-content: space-between;
            margin-bottom: 20px;
            padding: 10px;
            background-color: #fff;
            border-radius: 5px;
            box-shadow: 0 2px 10px rgba(0, 0, 0, 0.1);
        }

        .filters select, .filters input {
            padding: 10px;
            border: 1px solid #ddd;
            border-radius: 5px;
            width: 200px;
        }

        .filters button {
            padding: 10px 15px;
            background-color: #27ae60;
            color: white;
            border: none;
            border-radius: 5px;
            cursor: pointer;
        }

        .filters button:hover {
            background-color: #2ecc71;
        }

        /* Orders Table */
        table {
            width: 100%;
            border-collapse: collapse;
            background-color: #fff;
            border-radius: 5px;
            box-shadow: 0 2px 10px rgba(0, 0, 0, 0.1);
            margin-bottom: 30px;
        }

        table thead {
            background-color: #2980b9;
            color: white;
        }

        table th, table td {
            padding: 15px;
            text-align: left;
            border: 1px solid #ddd;
        }

        table tbody tr:nth-child(even) {
            background-color: #f2f2f2;
        }

        table tbody tr:hover {
            background-color: #f4f4f4;
            cursor: pointer;
        }

        table .status {
            padding: 5px 10px;
            border-radius: 4px;
            text-align: center;
            font-size: 14px;
        }

        .status.delivered {
            background-color: #2ecc71;
            color: white;
        }

        .status.pending {
            background-color: #e67e22;
            color: white;
        }

        .status.canceled {
            background-color: #e74c3c;
            color: white;
        }

        .actions button {
            padding: 5px 10px;
            background-color: #3498db;
            border: none;
            color: white;
            border-radius: 4px;
            cursor: pointer;
        }

        .actions button:hover {
            background-color: #2980b9;
        }

        /* Order Details Modal */
        .modal {
            display: none;
            position: fixed;
            z-index: 10;
            left: 0;
            top: 0;
            width: 100%;
            height: 100%;
            background: rgba(0, 0, 0, 0.5);
            justify-content: center;
            align-items: center;
        }

        .modal-content {
            background-color: white;
            padding: 30px;
            border-radius: 8px;
            width: 500px;
            position: relative;
        }

        .modal-header h2 {
            font-size: 24px;
            margin-bottom: 20px;
        }

        .modal-body p {
            margin-bottom: 10px;
            font-size: 18px;
            color: #34495e;
        }

        .modal-close {
            position: absolute;
            top: 10px;
            right: 10px;
            font-size: 20px;
            cursor: pointer;
        }
		
		/* The Modal (background overlay) */
		.modal {
		    display: none; /* Hidden by default */
		    position: fixed; /* Stay in place */
		    z-index: 1000; /* Sit on top */
		    left: 0;
		    top: 0;
		    width: 100%; /* Full width */
		    height: 100%; /* Full height */
		    background-color: rgba(0, 0, 0, 0.5); /* Black background with opacity */
		    align-items: center;
		    justify-content: center;
		    overflow: auto; /* Enable scroll if needed */
		}

		/* Modal Content Box */
		.modal-content {
		    background-color: #fff;
		    padding: 20px;
		    border-radius: 5px;
		    width: 500px;
		    box-shadow: 0px 5px 15px rgba(0, 0, 0, 0.3);
		    position: relative;
		}

		/* Modal Header */
		.modal-header h2 {
		    margin: 0;
		    font-size: 24px;
		}

		/* Modal Body */
		.modal-body {
		    margin: 15px 0;
		}

		.modal-body label {
		    font-weight: bold;
		    display: block;
		    margin-bottom: 5px;
		}

		.modal-body input[type="text"],
		.modal-body input[type="date"] {
		    width: 100%;
		    padding: 10px;
		    margin-bottom: 15px;
		    border: 1px solid #ccc;
		    border-radius: 4px;
		}

		/* Modal Footer */
		.modal-footer {
		    text-align: right;
		}

		/* Close Button */
		.modal-close {
		    position: absolute;
		    top: 10px;
		    right: 15px;
		    font-size: 18px;
		    font-weight: bold;
		    cursor: pointer;
		    color: #333;
		}

		/* Save Button */
		.modal-footer button {
		    background-color: #28a745;
		    color: white;
		    padding: 10px 20px;
		    border: none;
		    border-radius: 4px;
		    cursor: pointer;
		}

		.modal-footer button:hover {
		    background-color: #218838;
		}

		/* For responsive design */
		@media (max-width: 600px) {
		    .modal-content {
		        width: 90%; /* Adjust modal size for smaller screens */
		    }
		}


        /* Responsive Design */
        @media (max-width: 768px) {
            .filters {
                flex-direction: column;
            }

            .filters select, .filters input {
                margin-bottom: 10px;
                width: 100%;
            }

            .modal-content {
                width: 90%;
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
        }
    </style>
	
	   <script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>

	   <!-- Include DataTables CSS -->
	   <link rel="stylesheet" href="https://cdn.datatables.net/1.13.5/css/jquery.dataTables.min.css">

	   <!-- Include DataTables JavaScript -->
	   <script src="https://cdn.datatables.net/1.13.5/js/jquery.dataTables.min.js"></script>
	   <jsp:include page="url.jsp" />
	   <script>
		$(document).ready(function() {
		    $('.spinner-container').show();
		    
		    // Initialize DataTable when the document is ready
		    const table = $('#orderTable').DataTable({
		        columns: [
		            { title: "ID" },//Order Date
		            { title: "Order Date" },
		            { title: "Customer Name" },
					{ title: "Advance Payment" },
		            { title: "Status" },
					{ title: "Address" },
		            { title: "Delivery Date" },
		            { title: "Machines" },
		            { title: "Actions" }
		        ]
		    });

		    // Fetch orders when the page loads
		    fetchOrders();

		    // Function to handle button actions (View/Delete/Update)
			$(document).on('click', '.view-details-btn', function(filters = {}) {
			    const data = table.row($(this).closest('tr')).data();  // Get the data of the closest row
			    const orderId = data[0];  // Assuming ID is the first column
			    alert('View details for order ID: ' + orderId);
                 
				                $.ajax({
								        url: prod_url+'/api/order/getById?id=' + orderId,
								        type: 'GET',
								        success: function(order) {
											// Dynamically set values inside the modal based on the returned order data
											      $('#orderId').text('Order #' + order.id + ' Details');  // Set order ID
											      $('#customerName').text(order.customer_name);            // Set customer name
											      $('#orderStatus').text(order.status); 
												   $('#customerAddress').text(order.address);                   // Set order status
											      $('#deliveryDate').text(order.deliveryDate);             // Set delivery date
											                    // Set customer address

								        
								        },
								        error: function(xhr, status, error) {
								            console.error("Error fetching orders:", error);
								        }
								    });				
				
			    openModal();
			});

			$(document).on('click', '.delete-order-btn', function() {
			    const data = table.row($(this).closest('tr')).data();  // Get the data of the closest row
			    const orderId = data[0];  // Assuming ID is the first column
			    alert('Delete order ID: ' + orderId);
			});

			$(document).on('click', '.update-order-btn', function() {
			    const data = table.row($(this).closest('tr')).data();  // Get the data of the closest row
			    const orderId = data[0];  // Assuming ID is the first column
			    
			    // Fetch order details by ID
			    $.ajax({
			        url: prod_url+'/api/order/getById?id='+orderId,  // Your API URL for fetching order details
			        type: 'GET',
			        success: function(order) {
			            // Populate the update modal with the order details
			            $('#updateOrderId').val(order.id);
			            $('#updateCustomerName').val(order.customer_name);
			            $('#updateOrderStatus').val(order.status);
			            $('#updateDeliveryDate').val(order.deliveryDate);
			            $('#updateCustomerAddress').val(order.address);
			            
			            // Show the modal
			            openUpdateModal();
			        },
			        error: function(xhr, status, error) {
			            console.error("Error fetching order details:", error);
			        }
			    });
			});

			
			
			$('#saveOrderBtn').on('click', function() {
				
				const selectedVehicles = $('input[name="vehicle"]:checked').map(function() {
				        return this.value; // Get checked values
				    }).get();
				    const selectedVehiclesString = selectedVehicles.join(',');
			    const updatedOrder = {
			        id: $('#updateOrderId').val(),
			        customer_name: $('#updateCustomerName').val(),
			        status: $('#updateOrderStatus').val(),
					 machins:selectedVehiclesString,
			        deliveryDate: $('#updateDeliveryDate').val(),
			        address: $('#updateCustomerAddress').val()
			    };

			    // Send the updated order data via AJAX
			    $.ajax({
			        url: prod_url+'/api/order/update',  // Your API URL for updating the order
			        type: 'POST',
			        contentType: 'application/json',
			        data: JSON.stringify(updatedOrder),
			        success: function(response) {
			            alert("Order updated successfully!");
			            closeUpdateModal();  // Close the modal after a successful update
			            fetchOrders();  // Reload the orders table
			        },
			        error: function(xhr, status, error) {
			            console.error("Error updating order:", error);
			        }
			    });
			});




		    // Apply filter button logic
		    $('button:contains("Apply Filters")').click(function() {
		        fetchOrders({
		            status: $('select').val(),
		            fromDate: $('input[type="date"]').eq(0).val(),
		            toDate: $('input[type="date"]').eq(1).val()
		        });
		    });
		});

		// Fetch orders and populate the table
		function fetchOrders(filters = {}) {
		    $.ajax({
		        url: prod_url+'/api/order/getAll/complete',
		        type: 'GET',
		        data: filters, // Pass filters if any
		        success: function(orders) {
		            const table = $('#orderTable').DataTable();
		            table.clear(); // Clear existing rows
		            console.log(orders);
					orders.forEach(function(order) {
					    var orderId = order.id || '';
					    console.log("Order ID:", orderId);  // Debugging line						
					    table.row.add([
					        orderId,
					        order.order_date || '',
					        order.customer_name || '',
							order.advance,
					        order.status || '',
							order.address || '',
					        order.deliveryDate || '',
					        order.machins || '',
					        `<button class="view-details-btn" data-id="${orderId}">View</button>
					         <button class="delete-order-btn" data-id="${orderId}"></button>
					         <button class="update-order-btn" data-id="${orderId}">Update</button>`
					    ]).draw();
					});


		            
		            $('.spinner-container').hide(); // Hide the spinner
		        },
		        error: function(xhr, status, error) {
		            console.error("Error fetching orders:", error);
		        }
		    });
		}

		// Modal functions
		function openModal() {
		    document.getElementById('orderModal').style.display = 'flex';
		}

		function closeModal() {
		    document.getElementById('orderModal').style.display = 'none';
		}
		
		function openUpdateModal() {
						fetchVehiclesList();
					    $('#updateOrderModal').show();  // Display the update modal
					}

					function closeUpdateModal() {
					    $('#updateOrderModal').hide();  // Hide the update modal
					}
		
		
		function fetchVehiclesList() {
		        $.ajax({
		            url: prod_url+'/api/vehicles/getAll', // URL for fetching vehicle data
		            type: 'GET',
		            success: function(vehicles) {
		            	const vehicleContainer = document.getElementById('vehicleContainer'); // Get the container div
		                vehicleContainer.innerHTML = '';
		                console.log(vehicles);
		                vehicles.forEach(function(vehicle) {
		                	 // Create a label element
		                    const label = document.createElement('label');

		                    // Create a checkbox input element
		                    const checkbox = document.createElement('input');
		                    checkbox.type = 'checkbox';
		                    checkbox.name = 'vehicle';
		                    checkbox.value = vehicle.machineNumber;

		                    // Append the checkbox to the label
		                    label.appendChild(checkbox);

		                    // Add the text after the checkbox
		                    const textNode = document.createTextNode(vehicle.machineNumber);
		                    label.appendChild(textNode);

		                    // Create a <br> element for line break
		                    const br = document.createElement('br');

		                    // Append the label and the <br> to the container
		                    vehicleContainer.appendChild(label);
		                    vehicleContainer.appendChild(br);
		                });
		            },
		            error: function(xhr, status, error) {
		                console.error("Error fetching vehicle data:", error);
		                $('.spinner-container').hide(); // Hide the spinner on error as well
		            }
		        });
		    }

	   </script>
</head>
<body>
	<div class="spinner-container">
				    <div class="spinner"></div>
				</div>

    <div class="container">
        <!-- Page Header -->
        <div class="page-header">
            <h1>Orders</h1>
            <a href="addOrder.jsp" class="btn">Add New Order</a>
        </div>

        <!-- Filters Section -->
        <div class="filters">
            <select>
                <option value="">Filter by Status</option>
                <option value="delivered">Delivered</option>
                <option value="pending">Pending</option>
                <option value="canceled">Cancelled</option>
            </select>
            <input type="date" placeholder="From Date">
            <input type="date" placeholder="To Date">
            <button>Apply Filters</button>
        </div>

        <!-- Orders Table -->
        <table id="orderTable" class="display">
            <thead>
                <tr>
                    <th>Order ID</th>
                    <th>Order Date</th>
                    <th>Customer Name</th>
					<th>Advance Payment</th>
                    <th>Status</th>
					<th>Address</th>
                    <th>Vehicle Numbers</th>
                    <th>Delivery Date</th>
                    <th>Actions</th>
                </tr>
            </thead>
            <tbody id="orderTableBody">
                 

        </tbody>
        </table>

        <!-- Modal for Order Details -->
		<div class="modal" id="orderModal">
		    <div class="modal-content">
		        <span class="modal-close" onclick="closeModal()">x</span>
		        <div class="modal-header">
		            <h2 id="orderId">Loading ....</h2> <!-- Order ID -->
		        </div>
		        <div class="modal-body">
		            <p>Customer Name: <span id="customerName">....</span></p>
		            <p>Order Status: <span id="orderStatus">not set yet</span></p>
		            <p>Delivery Date: <span id="deliveryDate">....</span></p>
		            <p>Address: <span id="customerAddress">....</span></p>
		        </div>
		    </div>
		</div>
		
		<!-- Modal for Updating Order -->
		<div class="modal" id="updateOrderModal">
		    <div class="modal-content">
		        <span class="modal-close" onclick="closeUpdateModal()">x</span>
		        <div class="modal-header">
		            <h2>Update Order</h2>
		        </div>
				<div class="modal-body">
				    <input type="hidden" id="updateOrderId">
				    
				    <label for="updateCustomerName">Customer Name</label>
				    <input type="text" id="updateCustomerName">
				    
				    <label for="updateOrderStatus">Order Status</label>
				    <select id="updateOrderStatus">
				        <option value="Active">Active</option>
				        <option value="Pending">Pending</option>
						<option value="Complete">Complete</option>
				        <option value="Canceled">Canceled</option>
				    </select>
				    
				    <label for="updateDeliveryDate">Delivery Date</label>
				    <input type="date" id="updateDeliveryDate">
				    
				    <label for="updateCustomerAddress">Customer Address</label>
				    <input type="text" id="updateCustomerAddress">
				    
				    <div id="vehicleContainer">
				        <!-- Additional content for vehicles can go here -->
				    </div>
				</div>

		        <div class="modal-footer">
		            <button id="saveOrderBtn">Save Changes</button>
		        </div>
		    </div>
		</div>



    </div>
</body>
</html>
