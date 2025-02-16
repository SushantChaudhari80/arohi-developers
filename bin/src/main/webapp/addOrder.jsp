<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Add Vehicle</title>
    <link href="https://fonts.googleapis.com/css2?family=Poppins:wght@300;400;500;600&display=swap" rel="stylesheet">
    <style>
        * {
            margin: 0;
            padding: 0;
            box-sizing: border-box;
        }

        body, html {
            font-family: 'Poppins', sans-serif;
            background-color: #f4f6f9;
            color: #2C3E50;
        }

        .container {
            max-width: 800px;
            margin: 50px auto;
            padding: 20px;
            background-color: white;
            box-shadow: 0 2px 10px rgba(0, 0, 0, 0.1);
            border-radius: 10px;
        }

        h1 {
            text-align: center;
            font-size: 28px;
            font-weight: 500;
            margin-bottom: 30px;
        }

        .form-group {
            display: flex;
            flex-direction: column;
            margin-bottom: 20px;
        }

        label {
            font-size: 16px;
            font-weight: 500;
            margin-bottom: 8px;
        }

        input[type="text"] {
            padding: 12px;
            border: 1px solid #ddd;
            border-radius: 5px;
            font-size: 16px;
            transition: border-color 0.3s ease;
        }

        input[type="text"]:focus {
            outline: none;
            border-color: #2980b9;
        }

        .form-group.inline {
            display: grid;
            grid-template-columns: 1fr 1fr;
            gap: 20px;
        }

        button {
            padding: 12px;
            background-color: #2980b9;
            color: white;
            font-size: 16px;
            border: none;
            border-radius: 5px;
            cursor: pointer;
            transition: background-color 0.3s ease;
        }

        button:hover {
            background-color: #3498db;
        }

        .form-group.inline button {
            grid-column: span 2;
            justify-self: center;
        }

        /* Success message */
        .success-message {
            display: none;
            padding: 15px;
            background-color: #2ecc71;
            color: white;
            border-radius: 5px;
            text-align: center;
            margin-top: 20px;
        }

        /* Error message */
        .error-message {
            display: none;
            padding: 15px;
            background-color: #e74c3c;
            color: white;
            border-radius: 5px;
            text-align: center;
            margin-top: 20px;
        }

        /* Responsive Design */
        @media (max-width: 768px) {
            .form-group.inline {
                grid-template-columns: 1fr;
            }

            button {
                width: 100%;
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
    </style>
</head>
<body>

<div class="container">
    <h1>Add New Order</h1>
    
    <form id="addOrderForm">
        <div class="form-group inline">
            <div>
                <label for="machine_number">Customer Name</label>
                <input type="text" id="customer_name" name="customer_name" placeholder="Enter Customer Name">
            </div>
			<div>
			    <label for="machine_number">Customer Address</label>
			    <input type="text" id="customer_address" name="customer_address" placeholder="Enter Customer Address">
			 </div>
			 <div>
			 	 <label for="adv_payment">Advance Payment</label>
			 	 <input type="text" id="adv_payment" name="adv_payment" placeholder="Advance Payment">
			 </div>
            <div id="vehicleContainer">
			       
            </div>
        </div>

        <div class="form-group inline">
            <button type="submit">Add Order</button>
        </div>

        <div class="success-message" id="successMessage">
            Order added successfully!
        </div>
        <div class="error-message" id="errorMessage">
            Error adding Order. Please try again.
        </div>
    </form>
</div>
<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
<jsp:include page="url.jsp" />
<script>
	
	$(document).ready(function() {
	    // Function to fetch vehicle data from server using AJAX
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
	    fetchVehiclesList();
	});
   
    
	document.getElementById('addOrderForm').addEventListener('submit', function(event) {
	    event.preventDefault(); // Prevent form from submitting normally
		$('.spinner-container').show();
	    const customerName = document.getElementById('customer_name').value;
		const customerAddress = document.getElementById('customer_address').value;
		const advPayment = document.getElementById('adv_payment').value;
	    const selectedVehicles = $('input[name="vehicle"]:checked').map(function() {
	        return this.value; // Get checked values
	    }).get();
	    const selectedVehiclesString = selectedVehicles.join(',');
	    
	    console.log(selectedVehicles); // For debugging

	    $.ajax({
	        url: prod_url+'/api/order/add',  // URL for adding the order
	        type: 'POST',
	        contentType: 'application/json',
	        data: JSON.stringify({
	            customer_name: customerName,
				address: customerAddress,
	            machine_numbers: selectedVehiclesString,
				advance : advPayment
	        }),
	        success: function(msg) {
				
				$.ajax({
					        url: prod_url+'/api/payment/add',  // URL for adding the order
					        type: 'POST',
					        contentType: 'application/json',
					        data: JSON.stringify({
					            customer_name: customerName,
								amount : advPayment
					        }),
					        success: function(msg1) {

								if (msg === "Order added successfully!" && msg1 === "Payment Added Successfully") {
								    // Display success message
								    document.getElementById('successMessage').style.display = 'block';
								    document.getElementById('errorMessage').style.display = 'none';
									$('.spinner-container').hide();
									if (confirm("Order added successfully! , Want to go to the Order page?")) {
									    window.location.href = "order.jsp"; // Redirect to the order page
									} else {
									    window.location.reload(); // Reload the current page
									}
									
								} else {
								    // Display error message
								    document.getElementById('successMessage').style.display = 'none';
								    document.getElementById('errorMessage').style.display = 'block';
								}
								},
							error: function(xhr, status, error) {
						        console.error("Error adding order:", error);
							    // Display error message
								document.getElementById('successMessage').style.display = 'none';
								document.getElementById('errorMessage').style.display = 'block';
							 }
							 });
	        },
	        error: function(xhr, status, error) {
	            console.error("Error adding order:", error);
	            // Display error message
	            document.getElementById('successMessage').style.display = 'none';
	            document.getElementById('errorMessage').style.display = 'block';
	        }
	    });
	});


</script>

</body>
</html>
