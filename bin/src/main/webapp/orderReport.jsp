<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Order Report</title>
    <link href="https://fonts.googleapis.com/css2?family=Roboto:wght@400;500&display=swap" rel="stylesheet">
    <style>
        body {
            font-family: 'Roboto', sans-serif;
            background-color: #f4f7fa;
            margin: 0;
            padding: 0;
            color: #333;
        }

        .container {
            max-width: 1200px;
            margin: 20px auto;
            padding: 20px;
            background: #fff;
            border-radius: 8px;
            box-shadow: 0 2px 10px rgba(0, 0, 0, 0.1);
        }

        h1 {
            text-align: center;
            color: #34495e;
            margin-bottom: 30px;
        }

        .filters {
            display: flex;
            justify-content: space-between;
            margin-bottom: 20px;
        }

        .filters .filter-item {
            display: flex;
            flex-direction: column;
            margin-right: 15px;
        }

        .filters label {
            margin-bottom: 5px;
            font-weight: 500;
            color: #2c3e50;
        }

        .filters input, .filters select {
            padding: 10px;
            border: 1px solid #ddd;
            border-radius: 5px;
            width: 200px;
        }

        .filters .btn-filter {
            align-self: flex-end;
            padding: 10px 20px;
            background-color: #27ae60;
            color: white;
            border: none;
            border-radius: 5px;
            cursor: pointer;
        }

        .filters .btn-filter:hover {
            background-color: #2ecc71;
        }

        table {
            width: 100%;
            border-collapse: collapse;
            margin-bottom: 20px;
            box-shadow: 0 2px 8px rgba(0, 0, 0, 0.05);
        }

        th, td {
            padding: 15px;
            text-align: left;
            border: 1px solid #ddd;
        }

        th {
            background-color: #2980b9;
            color: white;
        }

        tr:nth-child(even) {
            background-color: #f9f9f9;
        }

        tr:hover {
            background-color: #f1f1f1;
        }

        .summary {
            display: flex;
            justify-content: space-between;
            background-color: #eef2f7;
            padding: 20px;
            border-radius: 5px;
            box-shadow: 0 2px 10px rgba(0, 0, 0, 0.05);
            margin-bottom: 20px;
        }

        .summary-item {
            text-align: center;
            flex: 1;
            padding: 20px;
            border-right: 1px solid #ddd;
        }

        .summary-item:last-child {
            border-right: none;
        }

        .summary-item h3 {
            margin: 0;
            font-size: 24px;
            color: #34495e;
        }

        .summary-item p {
            margin: 5px 0 0;
            color: #7f8c8d;
        }

        .pagination {
            display: flex;
            justify-content: center;
            padding: 20px;
        }

        .pagination a {
            padding: 10px 20px;
            margin: 0 5px;
            background-color: #2980b9;
            color: white;
            text-decoration: none;
            border-radius: 5px;
        }

        .pagination a:hover {
            background-color: #3498db;
        }

        .pagination .active {
            background-color: #27ae60;
            color: white;
        }
    </style>
	<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>

	   <!-- Include DataTables CSS -->
	   <link rel="stylesheet" href="https://cdn.datatables.net/1.13.5/css/jquery.dataTables.min.css">

	   <!-- Include DataTables JavaScript -->
	   <script src="https://cdn.datatables.net/1.13.5/js/jquery.dataTables.min.js"></script>
	   <jsp:include page="utility.jsp" />
	   <jsp:include page="url.jsp" />
	<script>
		$(document).ready(function() {
		    // Show spinner if needed
		    $('.spinner-container').show();

		    // Initialize DataTable
		    const table = $('#orderTable').DataTable({
		        columns: [
		            {
		                title: "<input type='checkbox' id='selectAll'>",
		                orderable: false,
		                className: 'select-checkbox',
		            },
		            { title: "Order ID" },
		            { title: "Customer Name" },
		            { title: "Vehicle Number" },
		            { title: "Date" },
		            { title: "Total Hours" },
		            { title: "Diesel" }
		        ]
		    });

		    // Fetch and populate vehicle data into the table
		    $.ajax({
		        url: prod_url+'/vehicle/getAll', // Adjust the endpoint URL if needed
		        type: 'GET',
		        dataType: 'json',
		        success: function(data) {
		            console.log(data);
		            table.clear();

		            data.forEach(function(record) {
		                const totalHours = calculateTotalHours(record.startReading, record.endReading);

		                table.row.add([
		                    `<input type="checkbox" class="row-checkbox" data-id="${record.id}">`,
		                    record.id,
		                    record.orderName || '',
		                    record.machineNumber || '',
		                    record.date || '',
		                    totalHours,
		                    record.diesel || '' // Fixed typo
		                ]);
		            });

		            table.draw();
		            $('.spinner-container').hide();
		        },
		        error: function(xhr, status, error) {
		            console.error("Error fetching records:", error);
		            alert("Failed to load data. Please try again.");
		            $('.spinner-container').hide();
		        }
		    });

		    // Function to calculate total hours
		    function calculateTotalHours(start, end) {
		        if (start && end) {
		            return end - start;
		        }
		        return 'N/A';
		    }

		    // Fetch vehicle list for the dropdown
		    $.ajax({
		        url: prod_url+'/api/vehicles/getAll',
		        type: 'GET',
		        success: function(vehicles) {
		            const vehicleList = $('#vehicaleList');
		            vehicleList.empty();
		            vehicleList.append('<option value="">Select a Vehicle</option>');

		            vehicles.forEach(function(vehicle) {
		                const option = $('<option></option>')
		                    .val(vehicle.id)
		                    .text(vehicle.machine_number || vehicle.machineNumber);
		                vehicleList.append(option);
		            });
		        },
		        error: function(xhr, status, error) {
		            console.error("Error fetching vehicle data:", error);
		            alert("Failed to load vehicle list. Please try again.");
		        }
		    });

			function getFormattedDate() {
				const today = new Date();
				const dd = String(today.getDate()).padStart(2, '0'); // Get day and add leading zero if needed
				const mm = String(today.getMonth() + 1).padStart(2, '0'); // Months are 0-based, add 1 and leading zero
				 const yyyy = today.getFullYear(); // Get full year

				return dd+'/'+mm+'/'+yyyy;
			}

		    // Generate Invoice
		    $('#generateInvoice').on('click', function() {
		        $.ajax({
		            url: prod_url+'/api/customers/get',
		            type: 'GET',
		            success: function(customer) {
		                console.log(customer);

		                const {
		                    mobile,
		                    name: ownerName,
		                    bussinessName,
		                    gstNo,
		                    acNo,
		                    ifsc,
		                    bankName,
		                    address
		                } = customer;

		                const selectedRows = [];
		                $('#orderTable tbody .row-checkbox:checked').each(function() {
		                    const rowIndex = $(this).closest('tr').index();
		                    const rowData = table.row(rowIndex).data();

		                    if (rowData) {
		                        selectedRows.push(rowData);
		                    }
		                });

		                if (selectedRows.length === 0) {
		                    alert('No rows selected for the invoice!');
		                    return;
		                }

		                console.log("Selected Rows:", selectedRows);
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
																											                        <th>Customer Name</th>
																											                        <th>Machine Number</th>
																											                        <th>Date</th>
																											                        <th>Total Hours</th>
																											                        <th>Amount</th>
																											                        
																									</tr>
																			                </thead>
																			                <tbody>
																			                   
																		    `;
																			let totalPaymentSum = 0; 
																			const advance = prompt("Enter Advance Payment (optional):", "");
																			const gst = prompt("Enter GST % (optional/0.09):", ""); 
																			
																			let newSoilRate;

																			do {
																			    newSoilRate = prompt("Enter rate per Hour (mandatory):", "");
																			    
																			    // Check if the user clicked "Cancel" or left the input blank
																			    if (newSoilRate === null) {
																			        alert("You must enter a rate to proceed.");
																			    } else if (newSoilRate.trim() === "") {
																			        alert("Rate cannot be empty. Please enter a valid rate.");
																			    }

																			} while (newSoilRate === null || newSoilRate.trim() === "");
																			let  totalHours = 0.0;
																			selectedRows.forEach(row => {
																				printContent += "<tr>";
																				row.forEach((value, index) => {
																					if (index === 0) return; 
																					if (index === 1) {
																						$.ajax({
																							  url: prod_url+'/api/reading/updateReading/'+value,// URL for fetching vehicle data
																								  type: 'POST',
																								  success: function (msg) {
																								     console.log(msg);
																								   },
																								   error: function (xhr, status, error) {
																									console.error("Error fetching vehicle data:", error);
																									$('.spinner-container').hide(); // Hide the spinner on error as well
																								}
																					});
																					return; 																
																					}
																					if (index === 6) return;
																					let displayValue = value || "0";
																					if(index===5){
																						totalHours = parseFloat(row[5]) || 0;
																						displayValue = totalHours;
																					}
																					printContent += "<td>" + displayValue + "</td>";
																					  });
																					  const amount = (totalHours * newSoilRate).toFixed(2);
																					  totalPaymentSum += parseFloat(amount);
																					  printContent += "<td>" + amount + "</td>";
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
																					                    <th>Add: CGST @ `; printContent +=gst ;printContent += `%</th>
																					                    <td colspan="6">`; printContent +=cgst ;printContent += `</td>
																					                </tr>
																					                <tr>
																					                    <th>Add: SGST @`; printContent +=gst ;printContent += `%</th>
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
																			        alert("Invoice saved successfully!");
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
					$('#selectAll').on('change', function () {
					           const isChecked = this.checked;
					           $('.row-checkbox').prop('checked', isChecked);
					       });

		});

	</script>
</head>
<body>

    <div class="container">
        <h1>Order Report</h1>

        <!-- Filters Section -->
        <div class="filters">
            <div class="filter-item">
                <label for="orderNumber">Order Number</label>
                <input type="text" id="orderNumber" placeholder="Enter order number">
            </div>
            <div class="filter-item">
                <label for="vehicaleList">Select Vehicale</label>
				<select id="vehicaleList">
							        <!-- Driver options will be dynamically appended -->
				</select>
            </div>
            <div class="filter-item">
                <label for="status">Status</label>
                <select id="status">
                    <option value="all">All</option>
                    <option value="completed">Completed</option>
                    <option value="pending">Pending</option>
                    <option value="cancelled">Cancelled</option>
                </select>
            </div>
            <button id="fltButton" class="btn-filter">Filter</button>
			<button id="generateInvoice" class="btn-filter" style="background-color: #2980b9; color: white;">Generate Invoice</button>

        </div>

        <!-- Summary Section -->
        <div class="summary">
            <div class="summary-item">
                <h3 id="totalOrders">0</h3>
                <p>Total Orders</p>
            </div>
            <div class="summary-item">
                <h3 id="totalCompleted">0</h3>
                <p>Completed Orders</p>
            </div>
            <div class="summary-item">
                <h3 id="totalPending">0</h3>
                <p>Pending Orders</p>
            </div>
            <div class="summary-item">
                <h3 id="totalCancelled">0</h3>
                <p>Cancelled Orders</p>
            </div>
        </div>

        <!-- Orders Table Section -->
        <table id="orderTable">
            <thead>
                <tr >
					<th></th>
                    <th>Order ID</th>
                    <th>Customer Name</th>
					<th>Vehicale Number</th>
                    <th>Date</th>
                    <th>Total hours</th>
                    <th>Diesel</th>
                </tr>
            </thead>
            <tbody>
               
            </tbody>
        </table>
    </div>

</body>
</html>
