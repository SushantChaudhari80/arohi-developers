
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Treep Receipt</title>
    <link href="https://fonts.googleapis.com/css2?family=Poppins:wght@300;400;500;600&display=swap" rel="stylesheet">
		<style>
		    /* General Reset */
		    * {
		        margin: 0;
		        padding: 0;
		        box-sizing: border-box;
		    }

		    body {
		        font-family: 'Poppins', sans-serif;
		        background-color: #f4f4f4;
		        color: #2c3e50;
		        display: flex;
		        justify-content: center;
		        align-items: center;
		        min-height: 100vh;
		        padding: 20px;
		    }
		

			       .receipt {
			           width: 500px;
			           background-color: #fff;
			           padding: 20px;
			           border: 1px solid #ccc;
			           border-radius: 5px;
			           box-shadow: 0 4px 8px rgba(0, 0, 0, 0.1);
			       }

			       .header {
			           text-align: center;
			           margin-bottom: 15px;
			       }

			       .header h1 {
			           font-size: 18px;
			           margin: 0;
			       }

			       .header p {
			           margin: 5px 0;
			           font-size: 12px;
			       }

			       .divider {
			           border-bottom: 1px dashed #000;
			           margin: 10px 0;
			       }

			       .details {
			           font-size: 14px;
			       }

			       .details div {
			           margin-bottom: 8px;
			       }

			       .footer {
			           display: flex;
			           justify-content: space-between;
			           font-size: 12px;
			           margin-top: 20px;
			       }

			       .footer div {
			           border-top: 1px solid #000;
			           text-align: center;
			           padding-top: 5px;
			       }

		    /* Container Styles */
		    .quotation-container {
		        width: 100%;
		        max-width: 800px;
		        background: #fff;
		        padding: 20px;
		        border-radius: 10px;
		        box-shadow: 0 4px 15px rgba(0, 0, 0, 0.1);
		    }

		    .quotation-header {
		        text-align: center;
		        border-bottom: 2px solid #3498db;
		        padding-bottom: 10px;
		        margin-bottom: 20px;
		    }

		    .quotation-header h1 {
		        font-size: 24px;
		        font-weight: 600;
		        color: #3498db;
		    }

		    /* Form Styles */
		    .quotation-form {
		        margin-bottom: 20px;
		    }

		    .quotation-form label {
		        font-size: 16px;
		        margin-bottom: 5px;
		        display: block;
		        font-weight: 500;
		    }

		    .quotation-form input,
		    .quotation-form select {
		        width: 100%;
		        padding: 10px;
		        margin-bottom: 15px;
		        border: 1px solid #ddd;
		        border-radius: 5px;
		        font-size: 14px;
		        color: #2c3e50;
		    }

		    /* Invoice Styles */
		    .invoice-container {
		        margin-top: 20px;
		        border: 1px solid #000;
		        padding: 20px;
		        background-color: #fdfdfd;
		    }

		    .invoice-container .header {
		        text-align: center;
		        font-weight: bold;
		        font-size: 18px;
		        border-bottom: 2px solid #000;
		        margin-bottom: 15px;
		        padding-bottom: 10px;
		    }

		    .invoice-container .sub-header {
		        text-align: center;
		        font-size: 14px;
		        margin-bottom: 20px;
		    }

		    .invoice-container .details {
		        margin: 20px 0;
		        font-size: 14px;
		    }

		    .invoice-container .details span {
		        display: inline-block;
		        margin-right: 15px;
				margin-left: 20px; /* Adds space between label and value */
				flex: 1; /* Ensures alignment across rows */
				text-align: right;
		    }

		    .invoice-container .details .field {
		        font-weight: bold;
		    }

		    .invoice-container table {
		        width: 100%;
		        border-collapse: collapse;
		        margin-top: 15px;
		    }

		    .invoice-container table,
		    .invoice-container th,
		    .invoice-container td {
		        border: 1px solid #000;
		    }

		    .invoice-container th,
		    .invoice-container td {
		        padding: 8px;
		        text-align: left;
		    }

		    .invoice-container .totals {
		        font-weight: bold;
		    }

		    .invoice-container .footer {
		        display: flex;
		        justify-content: space-between;
		        align-items: center;
		        margin-top: 20px;
		    }

		    .invoice-container .footer .signature {
		        border-top: 1px solid #000;
		        width: 200px;
		        text-align: center;
		        padding-top: 5px;
		    }

		    /* Button Styles */
		    .print-btn {
		        display: inline-block;
		        margin-top: 20px;
		        padding: 12px 20px;
		        background-color: #3498db;
		        color: white;
		        font-size: 16px;
		        font-weight: 600;
		        border: none;
		        border-radius: 5px;
		        cursor: pointer;
		        transition: background-color 0.3s ease;
		    }

		    .print-btn:hover {
		        background-color: #2980b9;
		    }
			
			#customerName {
					       color: red;
					   }

		    /* Print-only Styles */
		    @media print {
		        body * {
		            visibility: hidden;
		        }

		        #quotation-summary,
		        #quotation-summary * {
		            visibility: visible;
		        }

		        #quotation-summary {
		            position: absolute;
		            top: 0;
		            left: 0;
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
	<div class="spinner-container">
			    <div class="spinner"></div>
			</div>

    <div class="quotation-container">
        <div class="quotation-header">
            <h1>Generate Treep</h1>
        </div>
        <form id="quotation-form" class="quotation-form">
			
			<div class="filter-item">
				<label for="customer-name">Select Customer</label>
				<select id="customer-name">
					<!-- Driver options will be dynamically appended -->
				</select>
			</div>
          <!--   <label for="customer-name">Customer Name</label>
            <input type="text" id="customer-name" placeholder="Enter customer name"> -->

			<div class="filter-item">
			       <label for="vehicaleList">Select Vehicale</label>
					<select id="vehicaleList">
										        <!-- Driver options will be dynamically appended -->
					</select>
			 </div>
			 
			<label for="material">Select Material:</label>
			<select id="material" name="material">
				<option >Select</option>
			    <option value="Soil">Soil</option>
			    <option value="Bricks">Bricks</option>
			    <option value="Crush Sand">Crush Sand</option>
			    <option value="Sand">Sand</option>
			</select>

            <label for="soil-brass">Number of Brass/Treep Soil</label>
            <input type="number" id="soil-brass" placeholder="Enter number of brass" value="0">

            <label for="soil-rate">Soil Rate per Brass/Treep (₹)</label>
            <input type="number" id="soil-rate" placeholder="Enter rate per brass" value="0">
        </form>
        <div class="quotation-summary" id="quotation-summary">
            <h2>Receipt</h2>
            
			<div class="receipt">
			       <div class="header">
			           <div>
						<img src="img/logo.png" alt="Logo" style="max-width: 70%; height: auto;"/>
					</div>
			           <p id="summary-oname">Loading</p>
			           <p id="address"></p>
			           <p>Sand, Bricks, Crush Sand, Cement, Steel, Soil</p>
			           <p>And all building Material</p>
			       </div>
			       <div class="divider"></div>
			       <div class="details">
						<div style="display: flex; justify-content: space-between; align-items: center;">
						    <span>Bill No: <span id="">2102</span></span>
						    <span>Date: <span id="summary-date">____________</span></span>
						</div>
			           <div>Customer Name   : <span id="summary-customer-name">____________</span></div>
			           <div>Owner Name      : <span id="summary-oname-recept">____________</span></div>
			           <div>Vehicle Number  : <span id="summary-vehicle-number">____________</span></div>
			           <div>Material        : <span id="summary-soil">____________</span></div>
					   <div>Qty(Brass/Trip) : <span id="summary-soil-brass">____________</span></div>
					   <div>Rate            : <span id="summary-soil-rate"></span></div>
			       </div>
			       <div class="footer">
			           <div>Recipiant sign</div>
			           <div id="signatureId"></div>
			       </div>
			   </div>
			
        </div>

        <button class="print-btn" id="print-btn">Download as PDF</button>
		<button class="print-btn" id="save-btn">Save</button>
    </div>

	<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>

	<link rel="stylesheet" href="https://cdn.datatables.net/1.13.5/css/jquery.dataTables.min.css">

	 <script src="https://cdn.datatables.net/1.13.5/js/jquery.dataTables.min.js"></script>
	 <jsp:include page="url.jsp" />
	<script>
		
		$(document).ready(function () {
			$('.spinner-container').show();
			function getFormattedDate() {
			    const today = new Date();
			    const dd = String(today.getDate()).padStart(2, '0'); // Get day and add leading zero if needed
			    const mm = String(today.getMonth() + 1).padStart(2, '0'); // Months are 0-based, add 1 and leading zero
			    const yyyy = today.getFullYear(); // Get full year

			    return dd+'/'+mm+'/'+yyyy;
			}
		  
		    $.ajax({
		        url: prod_url+'/api/vehicles/getAll/loading',
		        type: 'GET',
		        success: function (vehicles) {
		            const vehicleList = $('#vehicaleList');
		            vehicleList.empty();
		            vehicleList.append('<option value="">Select a Vehicle</option>');
		            vehicles.forEach(function (vehicle) {
		                const option = $('<option></option>').val(vehicle.id).text(vehicle.machine_number || vehicle.machineNumber);
		                vehicleList.append(option);
		            });
					
		        },
		        error: function (xhr, status, error) {
		            console.error("Error fetching vehicle data:", error);
				
		        }
		    });
			
			$.ajax({
				        url: prod_url+'/api/order/getAll',
				        type: 'GET',
				        success: function (vehicles) {
				            const vehicleList = $('#customer-name');
				            vehicleList.empty();
				            vehicleList.append('<option value="">Select a Customer</option>');
				            vehicles.forEach(function (customer) {
				                const option = $('<option></option>').val(customer.id).text(customer.customer_name || '');
				                vehicleList.append(option);
				            });
				        },
				        error: function (xhr, status, error) {
				            console.error("Error fetching vehicle data:", error);
				        }
				    });
					
			$.ajax({
				                url: prod_url+'/api/customers/get',  // URL for fetching the customer data
				                type: 'GET',
				                success: function(customer) {
				                   console.log(customer);
									$('#summary-oname').text(customer.name+','+customer.mobile);
									$('#summary-oname-recept').text(customer.name);
									$('#address').text(customer.address);//signatureId
									$('#signatureId').text('For '+customer.bussinessName);
									$('.spinner-container').hide();
									const formattedDate = getFormattedDate();
									console.log(formattedDate);
									document.getElementById('summary-date').innerText = formattedDate || '-';
									$('.spinner-container').hide();
				                },
				                error: function(xhr, status, error) {
				                    console.error("Error fetching customer data:", error);
				                }
				            });

		    // Update summary when dropdown changes
		    $('#vehicaleList').on('change', function () {
		        const selectedVehicle = $(this).find('option:selected').text();
		        document.getElementById('summary-vehicle-number').innerText = selectedVehicle || '-';
		    });
			
			$('#material').on('change', function () {
				        const item = $(this).find('option:selected').text();
				        document.getElementById('summary-soil').innerText = item || '-';
			});

		    // Update summary dynamically
		    document.getElementById('quotation-form').addEventListener('input', function () {
		        const customerName = document.getElementById('customer-name').options[document.getElementById('customer-name').selectedIndex].text;
		        const soilBrass = document.getElementById('soil-brass').value;
		        const soilRate = document.getElementById('soil-rate').value;
              

		        document.getElementById('summary-customer-name').innerText = customerName || '-';
		      
		        document.getElementById('summary-soil-brass').innerText = soilBrass || '-';
		        document.getElementById('summary-soil-rate').innerText = soilRate || '-';
		        
				});

		    // Print functionality
		    document.getElementById('print-btn').addEventListener('click', function () {
				$('.spinner-container').show();
			         	//const customerName = document.getElementById('customer-name').value;
						const customerName = document.getElementById('customer-name').options[document.getElementById('customer-name').selectedIndex].text;
					        const soilBrass = document.getElementById('soil-brass').value;
					        const soilRate = document.getElementById('soil-rate').value;

					        // Calculate total payment
					        const selectedVehicleText = document.getElementById('vehicaleList').options[document.getElementById('vehicaleList').selectedIndex].text;
							var selectedItems=document.getElementById('material').options[document.getElementById('material').selectedIndex].text;

				               const formData = {
				                   selectedVehicle: selectedVehicleText,
				                   customerName:customerName,
				                   soilBrass: soilBrass,
				                   soilRate: soilRate,
				                   item:selectedItems,
								   isBilled:false
				               };
                              console.log(formData);
				               $.ajax({
				                   url: prod_url+'/api/treep/add', // Endpoint URL
				                   type: 'POST',
				                   contentType: 'application/json',
				                   data: JSON.stringify(formData),
				                   success: function (response) {
				                       console.log(response);
									   $('.spinner-container').hide();
				                   },
				                   error: function (xhr, status, error) {
				                       console.error('Error:', error);
									   $('.spinner-container').hide();
				                   }
				               });
		        window.print();
		    });
			document.getElementById('save-btn').addEventListener('click', function () {
				$('.spinner-container').show();
				                            const customerName = document.getElementById('customer-name').options[document.getElementById('customer-name').selectedIndex].text;
									        const soilBrass = document.getElementById('soil-brass').value;
									        const soilRate = document.getElementById('soil-rate').value;

									        // Calculate total payment
									        const selectedVehicleText = document.getElementById('vehicaleList').options[document.getElementById('vehicaleList').selectedIndex].text;
											var selectedItems=document.getElementById('material').options[document.getElementById('material').selectedIndex].text;

								               const formData = {
								                   selectedVehicle: selectedVehicleText,
								                   customerName:customerName,
								                   soilBrass: soilBrass,
								                   soilRate: soilRate,
								                   item:selectedItems,
												   isBilled:false
								               };
				                              console.log(formData);
								               $.ajax({
								                   url: prod_url+'/api/treep/add', // Endpoint URL
								                   type: 'POST',
								                   contentType: 'application/json',
								                   data: JSON.stringify(formData),
								                   success: function (response) {
													$('.spinner-container').hide();
								                       alert(response);
								                   },
								                   error: function (xhr, status, error) {
								                       alert('Error:', error);
								                   }
								               });
				    });
		});


    </script>
</body>
</html>