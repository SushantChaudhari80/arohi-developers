<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Transport Vehicles Page</title>
    <link href="https://fonts.googleapis.com/css2?family=Poppins:wght@300;400;500;600&display=swap" rel="stylesheet">
    <style>
        * {
            margin: 0;
            padding: 0;
            box-sizing: border-box;
        }
        
		#duePayment {
		       color: red;
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

        body, html {
            font-family: 'Poppins', sans-serif;
            background-color: #f4f6f9;
            color: #2C3E50;
        }

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

        /* Vehicles Section */
        .vehicles-grid {
            display: grid;
            grid-template-columns: repeat(auto-fit, minmax(250px, 1fr));
            gap: 20px;
        }

        .vehicle-card {
            background-color: #fff;
            border-radius: 8px;
            box-shadow: 0 2px 10px rgba(0, 0, 0, 0.1);
            overflow: hidden;
            padding: 20px;
            text-align: center;
            transition: transform 0.3s;
        }

        .vehicle-card:hover {
            transform: translateY(-5px);
        }

        .vehicle-card h3 {
            font-size: 20px;
            margin-bottom: 10px;
        }

        .vehicle-card p {
            color: black;
            margin-bottom: 15px;
        }
        .vehicle-card {
		    border: 1px solid red;  /* Temporary border to see the vehicle cards */
		    background-color: white;
		}
        

        .vehicle-status {
            padding: 5px 10px;
            border-radius: 4px;
            font-size: 14px;
            text-align: center;
            display: inline-block;
        }

        .status-active {
            background-color: #2ecc71;
            color: white;
        }

        .status-maintenance {
            background-color: #e67e22;
            color: white;
        }

        .status-unavailable {
            background-color: #e74c3c;
            color: white;
        }

        /* Modal for Detailed View */
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
           .machineNumberStyle {
			    background-color: #f0ad4e;  /* Amber color for machine number */
			    color: #fff;                /* White text to contrast */
			    padding: 10px;              /* Padding around the text */
			    border-radius: 5px;         /* Rounded corners */
			    text-align: center;         /* Center the text */
			}
		
			
			
			.companyStyle {
			    background-color: #5bc0de;  /* Light blue background for company name */
			    color: #fff;                /* White text to contrast */
			    padding: 10px;              /* Padding around the text */
			    border-radius: 5px;         /* Rounded corners */
			    text-align: center;         /* Center the text */
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
	<!-- Include jQuery -->
	<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>

	<!-- Include DataTables CSS -->
	<link rel="stylesheet" href="https://cdn.datatables.net/1.13.5/css/jquery.dataTables.min.css">

	<!-- Include DataTables JavaScript -->
	<script src="https://cdn.datatables.net/1.13.5/js/jquery.dataTables.min.js"></script>
	<jsp:include page="utility.jsp" />
	<jsp:include page="url.jsp" />
	<script>
		$(document).ready(function () {
		    $('.spinner-container').show();

		    // Initialize DataTable when the document is ready
		    const table = $('#vehicleTable').DataTable({
		        columns: [
		            {
		                title: "<input type='checkbox' id='selectAll'>",
		                orderable: false,
		                className: 'select-checkbox',
		            },
		            { title: "Treep ID" },
		            { title: "Date" },
		            { title: "Details" },
		            { title: "Customer Name" },
		            { title: "Vehicle Number" },
		            { title: "Diesel(Liter)" },
		            { title: "Advance Payment" },
		            { title: "Total Soil (Brass)" },
		            { title: "Soil Rate per Brass" },
		            { title: "Total Payment" }
		        ],
		        order: [[1, 'asc']], // Order by Treep ID by default
		    });

		    let selectedRows = [];

		    function calculateSums() {
		        let sumAdvance = 0;
		        let sumTotalPayment = 0;
		        let sumTotalDiesel = 0;

		        // Loop through only the visible rows (filtered rows)
		        table.rows({ filter: 'applied' }).every(function (rowIdx, tableLoop, rowLoop) {
		            const data = this.data();
		            const advance = parseFloat(data[7]) || 0; // Advance Payment is in the 7th column
		            const totalPayment = parseFloat(data[10]) || 0; // Total Payment is in the 10th column
		            const totalDiesel = parseFloat(data[6]) || 0; // Diesel is in the 6th column

		            sumAdvance += advance;
		            sumTotalPayment += totalPayment;
		            sumTotalDiesel += totalDiesel;
		        });

		        // Update the placeholders in the DOM
		        $('#sumAdvance').text(sumAdvance.toFixed(2));
		        $('#sumTotalPayment').text(sumTotalPayment.toFixed(2));
		        $('#sumTotalDiesel').text(sumTotalDiesel.toFixed(2));

		        // Calculate due payment
		        const due = sumTotalPayment - sumAdvance;
		        $('#duePayment').text(due.toFixed(2));
		    }

		    // Function to fetch vehicle data from the server using AJAX
		    function fetchVehiclesList() {
		        $.ajax({
		            url: prod_url+'/api/treep/getAll', // URL for fetching vehicle data
		            type: 'GET',
		            success: function (vehicles) {
		                table.clear(); // Clear existing rows
		                console.log(vehicles);

		                // Loop through each vehicle and add it to the DataTable
		                vehicles.forEach(function (vehicle) {
		                    table.row.add([
		                        `<input type="checkbox" class="row-checkbox" data-id="${vehicle.id || ''}">`,
		                        vehicle.id || '',
		                        vehicle.createDate || '',
		                        vehicle.item || '',
		                        vehicle.customerName || '',
		                        vehicle.selectedVehicle || '',
		                        vehicle.diesel || '',
		                        vehicle.advance || '',
		                        vehicle.soilBrass || '',
		                        vehicle.soilRate || '',
		                        vehicle.totalPayment || ''
		                    ]);
		                });

		                table.draw(false); // Draw the table once all rows are added
		                $('.spinner-container').hide(); // Hide the spinner
		                calculateSums();
		            },
		            error: function (xhr, status, error) {
		                console.error("Error fetching vehicle data:", error);
		                $('.spinner-container').hide(); // Hide the spinner on error as well
		            }
		        });
		    }

		    // Update sums on filtering or searching
		    table.on('search.dt', function () {
		        calculateSums();
		    });

			$('#printbtn').on('click', function() {
				        calculateSums();
				        window.print();
				});
		    // Track checkbox selections
		    $('#vehicleTable tbody').on('change', '.row-checkbox', function () {
		        const id = $(this).data('id');
		        if (this.checked) {
		            selectedRows.push(id);
		        } else {
		            selectedRows = selectedRows.filter(rowId => rowId !== id);
		        }

		        // Enable/Disable the print button
		        if (selectedRows.length > 0) {
		            $('#printInvoiceBtn').prop('disabled', false);
		        } else {
		            $('#printInvoiceBtn').prop('disabled', true);
		        }
		    });

		    // Select/Deselect all rows
		    $('#selectAll').on('change', function () {
		        const isChecked = this.checked;
		        $('.row-checkbox').prop('checked', isChecked).trigger('change');
		    });
			
			function getFormattedDate() {
						    const today = new Date();
						    const dd = String(today.getDate()).padStart(2, '0'); // Get day and add leading zero if needed
						    const mm = String(today.getMonth() + 1).padStart(2, '0'); // Months are 0-based, add 1 and leading zero
						    const yyyy = today.getFullYear(); // Get full year

						    return dd+'/'+mm+'/'+yyyy;
						}

		    // Generate PDF for selected rows
			$('#printInvoiceBtn').on('click', function () {
				$('.spinner-container').show();
				$.ajax({
								                url: prod_url+'/api/customers/get',  // URL for fetching the customer data
								                type: 'GET',
								                success: function(customer) {
								                   console.log(customer);
												    const mobile=customer.mobile;
												 	const ownerName=customer.name;
													const bussinessName=customer.bussinessName;
													const gstNo=customer.gstNo;
													const acNo=customer.acNo;
													const ifsc=customer.ifsc;
													const bankName=customer.bankName;
													const address=customer.address;
													
													
													const selectedRows = [];
																    $('#vehicleTable tbody .row-checkbox:checked').each(function () {
																        const rowIndex = $(this).closest('tr').index();
																        const rowData = table.row(rowIndex).data(); // Fetch data for the row

																        if (rowData) {
																            selectedRows.push(rowData);
																        }
																    });

																    if (selectedRows.length === 0) {
																        alert('No rows selected for the invoice!');
																        return;
																    }

																    console.log("Selected Rows:", selectedRows); // Debugging: Log selected rows

																    // Generate the print content
																    let printContent = `
																	<!DOCTYPE html>
																	<html lang="en">
																	<head>
																	    <meta charset="UTF-8">
																	    <meta name="viewport" content="width=device-width, initial-scale=1.0">
																	    <title>Tax Invoice</title>
																	    <style>
																	        body {
																	            font-family: Arial, sans-serif;
																	            margin: 0;
																	            padding: 0;
																	            background-color: #f9f9f9;
																	        }
																	        .invoice-container {
																	            width: 90%;
																	            margin: 20px auto;
																	            background: #fff;
																	            border: 1px solid #000;
																	            padding: 20px;
																	            box-shadow: 0 0 10px rgba(0, 0, 0, 0.1);
																	        }
																	        .invoice-header {
																	            text-align: center;
																	            margin-bottom: 20px;
																	        }
																	        .invoice-header h1 {
																	            margin: 0;
																	            font-size: 24px;
																	        }
																	        .invoice-header p {
																	            margin: 5px 0;
																	        }
																	        h2 {
																	            text-align: center;
																	            margin: 20px 0;
																	            font-size: 18px;
																	            text-decoration: underline;
																	        }
																	        .details-table, .items-table, .summary-table {
																	            width: 100%;
																	            border-collapse: collapse;
																	            margin-bottom: 20px;
																	        }
																	        .details-table th, .details-table td, .items-table th, .items-table td, .summary-table th, .summary-table td {
																	            border: 1px solid #000;
																	            padding: 8px;
																	            text-align: left;
																	        }
																	        .items-table th {
																	            background-color: #f0f0f0;
																	        }
																	        .section {
																	            margin-bottom: 20px;
																	        }
																	        .bank-details {
																	            margin-top: 20px;
																	            border: 1px solid #000;
																	            padding: 10px;
																	        }
																	        .bank-details p {
																	            margin: 5px 0;
																	        }
																	        .footer {
																	            text-align: center;
																	            margin-top: 20px;
																	            font-size: 14px;
																	        }
																	    </style>
																	</head>
																	<body>
																	    <div class="invoice-container">
																	        <div class="invoice-header">
																	            <h1>`;
																					printContent += bussinessName+"</h1>";
																	         printContent += "<p>"+address+"</p>";
																	           printContent +=` <h2>TAX INVOICE</h2>
																	        </div>

																	        <div class="section">
																	            <table class="details-table">
																	                <tr>
																	                    <th>Invoice No:</th>`;
																						
																	                     printContent +="<td>"+ownerName+"</td>"+
																	                    "<th>GSTIN:</th>"+
																	                    "<td>"+gstNo+"</td>";
																	               printContent +=`  </tr>
																	                <tr>
																	                    <th>Invoice Date:</th>
																	                    <td>`;
																							 printContent +=getFormattedDate(); printContent +=`</td>
																	                    <th>Reverse Charge (Yes/No):</th>
																	                    <td>No</td>
																	                </tr>
																	                <tr>
																	                    <th>Place of Supply of Services:</th>
																	                    <td>Maharashtra</td>
																	                    <th>Code:</th>
																	                    <td></td>
																	                </tr>
																	            </table>
																	        </div>

																	        <div class="section">
																	            <table class="details-table">
																	                <tr>
																	                    <th colspan="2">Details of Receiver/Billed to</th>
																	                    <th colspan="2">Details of Receiver/Billed to</th>
																	                </tr>
																	                <tr>
																	                    <th>Name:</th>
																	                    <td>`;printContent +=ownerName; printContent +=`</td>
																	                    <th>Shipping Address:</th>
																	                    <td></td>
																	                </tr>
																	                <tr>
																	                    <th>Address:</th>
																	                    <td></td>
																	                    <th>Date of Supply of Services:</th>
																	                    <td>DD/MM/YYYY</td>
																	                </tr>
																	                <tr>
																	                    <th>GSTIN:</th>
																	                    <td></td>
																	                    <th>Code:</th>
																	                    <td>27</td>
																	                </tr>
																	            </table>
																	        </div>

																	        <div class="section">
																	            <table class="items-table">
																	                <thead>
																						<tr>
																									                        <th>Treep ID</th>
																									                        <th>Date</th>
																									                        <th>Details</th>
																									                        <th>Customer Name</th>
																									                        <th>Vehicle Number</th>
																									                        <th>Diesel (Liter)</th>
																									                        <th>Advance Payment</th>
																									                        <th>Total Soil (Brass)</th>
																									                        <th>Soil Rate per Brass</th>
																									                        <th>Total Payment</th>
																							</tr>
																	                </thead>
																	                <tbody>
																	                   
																    `;

																  
																	let totalPaymentSum = 0; // Variable to store the sum of totalPayment
																	
																	
																	 const advance = prompt("Enter Advance Payment (optional):", "");
																	 const newSoilRate = prompt("Enter Soil Rate per Brass (optional):", "");
																	 const gst = prompt("Enter GST % (optional/0.09):", "");
																	 console.log(selectedRows);

																	selectedRows.forEach(row => {
																	    printContent += "<tr>";

																	    row.forEach((value, index) => {
																	        if (index === 0) return; // Skip checkbox column

																	        let displayValue = value || "0"; // Default to "0" if value is empty
																			
																			if (index === 1){
																				$.ajax({
																					  url: prod_url+'/api/treep/updateTreep/'+value,// URL for fetching vehicle data
																					  type: 'POST',
																					  success: function (msg) {
																					 console.log(msg);
																					},
																					error: function (xhr, status, error) {
																							console.error("Error fetching vehicle data:", error);
																							$('.spinner-container').hide(); // Hide the spinner on error as well
																						}
																					});
																		   }

																	        if (index === 5 && value === "Select a Vehicle") {
																	            displayValue = "N/A"; // Handle special case for vehicle selection
																	        }
																			
																			if(index === 7 && advance !== null && advance !== ""){
																				displayValue = advance;
																			} 
																			
																			if (index === 9) {
																			       displayValue = newSoilRate !== null && newSoilRate !== "" ? newSoilRate : value; // Use user input for Soil Rate if provided
																			 }																 
																			

																	        // Calculate totalPayment for row[10]
																	        if (index === 10) { // Assuming row[10] is for totalPayment
																	            const totalSoil = parseFloat(row[8]) || 0; // Assuming row[8] is totalSoil
																	            const soilRate = newSoilRate !== null && newSoilRate !== "" ? parseFloat(newSoilRate) : parseFloat(row[9]) || 0; // Assuming row[9] is soilRate
																	            const totalPayment = (totalSoil * soilRate).toFixed(2); // Calculate and format totalPayment

																	            displayValue = totalPayment;

																	            totalPaymentSum += parseFloat(totalPayment); // Add totalPayment to the sum
																	        }

																	        printContent += "<td>" + displayValue + "</td>";
																	    });

																	    printContent += "</tr>";
																	});

                                                                     console.log(totalPaymentSum);
																	const cgst = (totalPaymentSum * gst).toFixed(2); 
																	const sgst = (totalPaymentSum * gst).toFixed(2); 
																	const totalGST = (parseFloat(cgst) + parseFloat(sgst)).toFixed(2); 
																	const totalPaymentAmount = (parseFloat(totalGST) + parseFloat(totalPaymentSum)).toFixed(2);
																	const totalamounttopay =  (parseFloat(totalGST) + parseFloat(totalPaymentSum)).toFixed(2);
																	const totaldueamount =  (parseFloat(totalPaymentAmount) - parseFloat(advance)).toFixed(2);
																	const totalPaymentSumWords = numberToWords(totalPaymentSum);
																    printContent += `
																
																			                </tbody>
																			            </table>
																			        </div>

																			        <div class="section">
																			            <table class="summary-table">
																							<tr>
																								<th>Total Invoice Amount in Words:</th>
																								<td colspan="6">`; printContent +="Rs."+totalPaymentSumWords ;printContent += `</td>
																							</tr>
																							
																			                <tr>
																			                    <th>Less: Discount</th>
																			                    <td colspan="6">-</td>
																			                </tr>
																			                <tr>
																			                    <th>Net Taxable Value</th>
																			                    <td colspan="6">`; printContent +=totalPaymentSum ;printContent += `</td>
																			                </tr>
																			                <tr>
																			                    <th>Add: CGST @`; printContent +=gst ;printContent += `%</th>
																			                    <td colspan="6">`; printContent +=cgst ;printContent += `</td>
																			                </tr>
																			                <tr>
																			                    <th>Add: SGST @ `; printContent +=gst ;printContent += `%</th>
																			                    <td colspan="6">`; printContent +=sgst ;printContent += `</td>
																			                </tr>
																			                <tr>
																			                    <th>Total Tax Amount</th>
																			                    <td colspan="6">`; printContent +=totalGST ;printContent += `</td>
																			                </tr>
																			                <tr>
																			                    <th>Total Invoice Value</th>
																			                    <td colspan="6">`; printContent +=totalPaymentAmount ;printContent += `</td>
																			                </tr>
																							<tr>
																								<th>Total Amount to pay:</th>
																								<td colspan="6">`; printContent +="Rs."+advance ;printContent += `</td>
																							</tr>
																							<tr>
																							   <th>Total Due Amount :</th>
																								<td colspan="6">`; printContent +="Rs."+totaldueamount ;printContent += `</td>
																							</tr>
																																										               
																			            </table>
																			        </div>

																			        <div class="bank-details">
																			            <p><strong>Bank Name:</strong>`; printContent +=bankName ;printContent += `</p>
																			            <p><strong>Bank A/C:</strong> `; printContent +=acNo ;printContent += `</p>
																			            <p><strong>IFSC:</strong> `; printContent +=ifsc ;printContent += `</p>
																			        </div>

																			        <div class="footer">
																			            <p>Certified that the particulars given above are true and correct</p>
																			            <p>For `; printContent +=bussinessName ;printContent += `</p>
																			            <p><strong>Authorized Signatory</strong></p>
																			        </div>
																			    </div>
																			</body>
																			</html>
																    `;
																	
																	const dtoData={
																		billedDate:getFormattedDate(),
																		invoice : printContent
																	};
																	

																	$.ajax({
																	    url: prod_url+'/api/invoice/save',
																	    type: 'PUT',
																	    contentType: 'application/json', // Specify content type if dtoData is JSON
																	    data: JSON.stringify(dtoData),  // Convert dtoData to JSON if not already
																	    success: function (msg) {
																	        console.log("Response:", msg);
																			$('.spinner-container').hide();
																	        alert("Invoice saved successfully!");
																			window.location.reload();
																	    },
																	    error: function (xhr, status, error) {
																	        console.error("Error saving invoice:", error);
																	        alert("Failed to save invoice. Please try again.");
																	        $('.spinner-container').hide(); // Hide spinner on error
																	    }
																	});
																	
																	// Open the content in a new window and print
																    const printWindow = window.open('', '_blank');
																    printWindow.document.write(printContent);
																    printWindow.document.close();
																    printWindow.print();
													
													
													
								                },
								                error: function(xhr, status, error) {
								                    console.error("Error fetching customer data:", error);
								                }
								            });
			    
			});


		    // Call the function to load vehicle data when the page is ready
		    fetchVehiclesList();
		});

	</script>
</head>
<body>
	<div class="spinner-container">
					    <div class="spinner"></div>
					</div>
    <div class="container">
        <!-- Page Header -->
        <div class="page-header">
            <h1>Treep Report</h1>
			<div>
	            <a id="printbtn" class="btn">Print</a>
				<a id="printInvoiceBtn" class="btn">Generate Invoice</a>
			</div>
        </div>
		  <div id="summary">
			   <p><strong>Sum of Total Payment: </strong><span id="sumTotalPayment">0</span></p>
		       <p><strong>Sum of Advance Payment: </strong><span id="sumAdvance">0</span></p>
			   <p><strong>Sum of Total Disel: </strong><span id="sumTotalDisel">0</span></p>
			   <p><strong>Due Payment: </strong><span id="duePayment">0</span></p>
		   </div>

		<table id="vehicleTable" class="display">
		    <thead>
		        <tr>
					<th></th>
					<th>Treep ID</th>
					<th>Date</th>
					<th>Details</th>
		            <th>Customer Name</th>
		            <th>Vehicle Number</th>
		            <th>Diesel (Liters)</th>
					<th>Advance Payment</th>
		            <th>Total Soil (Brass/qty)</th>
					<th>Soil Rate per Brass</th>
					<th>Total Payment</th>
		        </tr>
		    </thead>
		    <tbody>
		        <!-- Rows will be dynamically added here -->
		    </tbody>
		</table>
		
        <!-- Modal for Vehicle Details -->
        <div class="modal" id="vehicleModal">
            <div class="modal-content">
                <span class="modal-close" onclick="closeModal()">x</span>
                <div class="modal-header">
                    <h2>Vehicle 01 Details</h2>
                </div>
                <div class="modal-body">
                    <p>Type: Truck</p>
                    <p>Status: Active</p>
                    <p>Last Serviced: 2024-08-01</p>
                    <p>License Plate: ABC-1234</p>
                </div>
            </div>
        </div>

    </div>

    <!-- JavaScript for Modal -->
    <script>
        function openModal() {
            document.getElementById('vehicleModal').style.display = 'flex';
        }

        function closeModal() {
            document.getElementById('vehicleModal').style.display = 'none';
        }
    </script>

</body>
</html>
