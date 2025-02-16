
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
			           display: flex;
			           justify-content: space-between;
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
		        margin-left: 20px;
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
		     .table {
            width: 100%;
            border-collapse: collapse;
            margin-top: 10px;
        }
        .table, .table th, .table td {
            border: 1px solid black;
            padding: 8px;
            text-align: left;
        }
		</style>
	
</head>
<body>
    <div class="quotation-container">
        <div class="quotation-header">
            <h1>Quotation</h1>
        </div>
        <form id="quotation-form" class="quotation-form">
			
			<div class="filter-item">
				<label for="customer-name">Select Customer</label>
				<select id="customer-name">
					<!-- Driver options will be dynamically appended -->
				</select>
		
			 
			<label for="material">Select Material:</label>
			<select id="material" name="material">
				<option value="Other">Other</option>
				<option value="Sand">Sand</option>
				<option value="Bricks">Bricks</option>
				 <option value="Crush Sand">Crush Sand</option>
				 <option value="Cement">Cement</option>
				 <option value="Steel">Steel</option>
			    <option value="Soil">Soil</option>
			</select>

            <label for="soil-brass">Qty</label>
            <input type="number" id="soil-brass" placeholder="Enter number of brass" value="0">

            <label for="soil-rate">Rate</label>
            <input type="number" id="soil-rate" placeholder="Enter rate per brass" value="0">
			
			<input  type="button" id="calculate" value="Calculate total"></input>
        </form>
  </div>
  <div>
       <div class="quotation-summary" id="quotation-summary">
            <h2>Quatation</h2>
            
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
    						<div>
    						   <div>Customer Name   : <span id="summary-customer-name">____________</span></div>
    						   <div>Address   : <span id="summary-customer-address">____________</span></div>
    						</div>
    						<div style="display:flex;flex-direction:column">
    			         <span>Bill No: <span id="">2102</span></span>
    						   <span>Date: <span id="summary-date">____________</span></span>
    			         <span>GST NO: <span id="summary-no">____________</span></span>
			         </div>
			       </div>
			       <table class="table">
			       <thead>
		                <tr>
		                    <th>Sr No</th>
		                    <th>Item Deatils</th>
		                    <th>Qty</th>
		                    <th>Rate</th>
		                    <th>Amount</th>
		                </tr>
		           </thead>   
		           <tbody>
	                 <tr>
	                    <td>1.</td>
	                    <td>Sand</td>
	                    <td id="sandQty"></td>
	                    <td id="sandRate"></td>
	                    <td id="sTotal">0</td>
	                </tr>
	                <tr>
	                    <td>2.</td>
	                    <td>Bricks</td>
	                    <td id="brickQty"></td>
	                    <td id="brickrate"></td>
	                    <td id="bTotal">0</td> 
	                </tr>
	                <tr>
	                    <td>3.</td>
	                    <td>Crush Sand</td>
	                    <td id="cQty"></td>
	                    <td id="cRate"></td>
	                    <td id="cTotal">0</td> 
	                </tr>
	                <tr>
	                    <td>4.</td>
	                    <td>Cement</td>
	                    <td id="cementQty"></td>
	                    <td id="cementRate"></td>
	                    <td id="cementTotal">0</td>
	                </tr>
	                <tr>
	                    <td>5.</td>
	                    <td>Steel</td>
	                    <td id="steelQty"></td>
	                    <td id="steelRate"></td>
	                    <td id="steelTotal">0</td> 
	                </tr>
	                <tr>
	                    <td>6.</td>
	                    <td>Soil</td>
	                    <td id="soilQty"></td>
	                    <td id="soilRate"></td>
	                    <td id="soilTotal">0</td>
	                </tr>
	                <tr>
	                    <td>7.</td>
	                    <td>Others</td>
	                    <td id="otherQty"></td>
	                    <td id="otherRate"></td>
	                    <td id="otherTotal">0</td>
	                </tr>
	                <tr>
	                  <td colspan=4>Total Amount</td>
	                  <td id="totalAmount">0</td>
	                </tr>
	               </tbody>  
            </table>
			       <div style="width:100%; display:flex; flex-direction:column">
			           <div>Recipiant sign</div>
			           <div id="signatureId"></div>
			       </div>
			   </div>
			
        </div>
</div>


<br><br>
		<div>
			 <button class="print-btn" id="print-btn">Print</button>
			 <!--<button class="print-btn" id="save-btn">Save</button>--> 
		</div>
	<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>

	<link rel="stylesheet" href="https://cdn.datatables.net/1.13.5/css/jquery.dataTables.min.css">

	 <script src="https://cdn.datatables.net/1.13.5/js/jquery.dataTables.min.js"></script>
	 <jsp:include page="url.jsp" />
	<script>
		
		$(document).ready(function () {
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
				                const option = $('<option></option>').val(customer.address).text(customer.customer_name || '');
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
									$('#signatureId').text('For '+customer.bussinessName);//summary-no
									$('#summary-no').text(customer.gstNo);
									$('.spinner-container').hide();
									const formattedDate = getFormattedDate();
									console.log(formattedDate);
									document.getElementById('summary-date').innerText = formattedDate || '-';
				                },
				                error: function(xhr, status, error) {
				                    console.error("Error fetching customer data:", error);
				                }
				            });

		    // Update summary when dropdown changes
		    $('#material').on('change', function () {
		        const material = $(this).find('option:selected').text();
		        if(material === 'Bricks'){
		        	const soilBrass = document.getElementById('soil-brass').value;
			        const soilRate = document.getElementById('soil-rate').value;
			        
			        $("#brickQty").text(soilBrass);
			        $("#brickrate").text(soilRate); 
			        $("#bTotal").text(soilBrass * soilRate); 
		        }
		        if(material === 'Other'){
		        	const soilBrass = document.getElementById('soil-brass').value;
			        const soilRate = document.getElementById('soil-rate').value;
			        
			        $("#otherQty").text(soilBrass);
			        $("#otherRate").text(soilRate); 
			        $("#otherTotal").text(soilBrass * soilRate); 
		        }
		        if(material === 'Sand'){
		        	const soilBrass = document.getElementById('soil-brass').value;
			        const soilRate = document.getElementById('soil-rate').value;
			        
			        $("#sandQty").text(soilBrass);
			        $("#sandRate").text(soilRate); 
			        $("#sTotal").text(soilBrass * soilRate); 
		        }
		        if(material === 'Crush Sand'){
		        	const soilBrass = document.getElementById('soil-brass').value;
			        const soilRate = document.getElementById('soil-rate').value;
			        
			        $("#cQty").text(soilBrass);
			        $("#cRate").text(soilRate); 
			        $("#cTotal").text(soilBrass * soilRate); 
		        }
		        if(material === 'Cement'){
		        	const soilBrass = document.getElementById('soil-brass').value;
			        const soilRate = document.getElementById('soil-rate').value;
			        
			        $("#cementQty").text(soilBrass);
			        $("#cementRate").text(soilRate); 
			        $("#cementTotal").text(soilBrass * soilRate); 
		        }
		        if(material === 'Steel'){
		        	const soilBrass = document.getElementById('soil-brass').value;
			        const soilRate = document.getElementById('soil-rate').value;
			        
			        $("#steelQty").text(soilBrass);
			        $("#steelRate").text(soilRate); 
			        $("#steelTotal").text(soilBrass * soilRate); 
		        }
		        if(material === 'Soil'){
		        	const soilBrass = document.getElementById('soil-brass').value;
			        const soilRate = document.getElementById('soil-rate').value;
			        
			        $("#soilQty").text(soilBrass);
			        $("#soilRate").text(soilRate); 
			        $("#soilTotal").text(soilBrass * soilRate); 
		        }
		    });
			
			/* $('#material').on('change', function () {
				        const item = $(this).find('option:selected').text();
				        document.getElementById('summary-soil').innerText = item || '-';
			}); */
			
			

		    // Update summary dynamically
		    document.getElementById('quotation-form').addEventListener('input', function () {
		        const customerName = document.getElementById('customer-name').options[document.getElementById('customer-name').selectedIndex].text;
		        const material = document.getElementById('material').options[document.getElementById('material').selectedIndex].text;
                const address = document.getElementById('customer-name').options[document.getElementById('customer-name').selectedIndex].value;

		        document.getElementById('summary-customer-name').innerText = customerName || '-';
		        document.getElementById('summary-customer-address').innerText = address || '-';
		        if(material === 'Bricks'){
		        	const soilBrass = document.getElementById('soil-brass').value;
			        const soilRate = document.getElementById('soil-rate').value;
			        
			        $("#brickQty").text(soilBrass);
			        $("#brickrate").text(soilRate); 
			        $("#bTotal").text(soilBrass * soilRate); 
		        }
		        if(material === 'Other'){
		        	const soilBrass = document.getElementById('soil-brass').value;
			        const soilRate = document.getElementById('soil-rate').value;
			        
			        $("#otherQty").text(soilBrass);
			        $("#otherRate").text(soilRate); 
			        $("#otherTotal").text(soilBrass * soilRate); 
		        }
		        if(material === 'Sand'){
		        	const soilBrass = document.getElementById('soil-brass').value;
			        const soilRate = document.getElementById('soil-rate').value;
			        
			        $("#sandQty").text(soilBrass);
			        $("#sandRate").text(soilRate); 
			        $("#sTotal").text(soilBrass * soilRate); 
		        }
		        if(material === 'Crush Sand'){
		        	const soilBrass = document.getElementById('soil-brass').value;
			        const soilRate = document.getElementById('soil-rate').value;
			        
			        $("#cQty").text(soilBrass);
			        $("#cRate").text(soilRate); 
			        $("#cTotal").text(soilBrass * soilRate); 
		        }
		        if(material === 'Cement'){
		        	const soilBrass = document.getElementById('soil-brass').value;
			        const soilRate = document.getElementById('soil-rate').value;
			        
			        $("#cementQty").text(soilBrass);
			        $("#cementRate").text(soilRate); 
			        $("#cementTotal").text(soilBrass * soilRate); 
		        }
		        if(material === 'Steel'){
		        	const soilBrass = document.getElementById('soil-brass').value;
			        const soilRate = document.getElementById('soil-rate').value;
			        
			        $("#steelQty").text(soilBrass);
			        $("#steelRate").text(soilRate); 
			        $("#steelTotal").text(soilBrass * soilRate); 
		        }
		        if(material === 'Soil'){
		        	const soilBrass = document.getElementById('soil-brass').value;
			        const soilRate = document.getElementById('soil-rate').value;
			        
			        $("#soilQty").text(soilBrass);
			        $("#soilRate").text(soilRate); 
			        $("#soilTotal").text(soilBrass * soilRate); 
		        }
		        
				});

		    // Print functionality
		    document.getElementById('print-btn').addEventListener('click', function () {
			         	//const customerName = document.getElementById('customer-name').value;
						/* const customerName = document.getElementById('customer-name').options[document.getElementById('customer-name').selectedIndex].text;
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
				                   },
				                   error: function (xhr, status, error) {
				                       console.error('Error:', error);
				                   }
				               }); */
		        window.print();
		    });
			document.getElementById('calculate').addEventListener('click', function () {
				const a1 = parseFloat(document.getElementById('sTotal').innerText) || 0;
				    const a2 = parseFloat(document.getElementById('bTotal').innerText) || 0;
				    const a3 = parseFloat(document.getElementById('cTotal').innerText) || 0;
				    const a4 = parseFloat(document.getElementById('cementTotal').innerText) || 0;
				    const a5 = parseFloat(document.getElementById('steelTotal').innerText) || 0;
				    const a6 = parseFloat(document.getElementById('soilTotal').innerText) || 0;
				    const a7 = parseFloat(document.getElementById('otherTotal').innerText) || 0;

				    // Calculate the grand total
				    const total = a1 + a2 + a3 + a4 + a5 + a6 + a7;

				    // Update the total amount in the table
				    document.getElementById('totalAmount').innerText = total.toFixed(2);
				});
			document.getElementById('save-btn').addEventListener('click', function () {
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