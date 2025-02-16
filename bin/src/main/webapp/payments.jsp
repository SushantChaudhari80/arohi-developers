<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Payment Report</title>
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

        .summary {
            display: flex;
            justify-content: space-between;
            background-color: #eef2f7;
            padding: 20px;
            border-radius: 5px;
            box-shadow: 0 2px 10px rgba(0, 0, 0, 0.05);
            margin-bottom: 20px;
            flex-wrap: wrap;
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
    <script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
    <link rel="stylesheet" href="https://cdn.datatables.net/1.13.5/css/jquery.dataTables.min.css">
    <script src="https://cdn.datatables.net/1.13.5/js/jquery.dataTables.min.js"></script>
</head>
<body>
	<div class="spinner-container">
			    <div class="spinner"></div>
			</div>
<div class="container">
    <h1>Payment History</h1>

    <!-- Summary Section -->
    <div class="summary">
        <div class="summary-item">
            <h3 id="totalCustomers">0</h3>
            <p>Total Customers</p>
        </div>
        <div class="summary-item">
            <h3 id="totalProfit">0 RS</h3>
            <p>Total Profit</p>
        </div>
        <div class="summary-item">
            <h3 id="totalbilled">0 RS</h3>
            <p>Total Billed</p>
        </div>
        <div class="summary-item">
            <h3 id="dueAmount">0 RS</h3>
            <p>Due Amount</p>
        </div>
    </div>
	<div style="display: flex; justify-content: flex-end; align-items: center; gap: 10px; margin-bottom: 20px;">
	    <label for="customer-name1" style="margin-right: 10px;">Select Customer</label>
	    <select id="customer-name1" style="width: 20%; padding: 10px; border: 1px solid #ddd; border-radius: 4px;">
	        <!-- Options will go here -->
	    </select>
	    <button id="viewCustomerBtn" style="padding: 10px 20px; background-color: #2980b9; color: white; border: none; border-radius: 5px; cursor: pointer;">
	        View
	    </button>
	    <button id="addPaymentBtn" style="padding: 10px 20px; background-color: #2980b9; color: white; border: none; border-radius: 5px; cursor: pointer;">
	        Add Payment
	    </button>
	</div>



    <!-- Diesel Data Table -->
    <table id="dieselReport">
        <thead>
        <tr>
            <th>ID</th>
            <th>Date</th>
            <th>Customer Name</th>
			<th>Paid Amount</th>
			<th>Total Due</th>
        </tr>
        </thead>
        <tbody>
        </tbody>
    </table>
	
	<div id="addPaymentModal" style="display: none; position: fixed; top: 0; left: 0; width: 100%; height: 100%; background-color: rgba(0, 0, 0, 0.5); justify-content: center; align-items: center;">
	    <div style="background: white; padding: 20px; width: 400px; border-radius: 8px; box-shadow: 0 4px 15px rgba(0, 0, 0, 0.2); position: relative;">
	        <h2 style="margin-top: 0; text-align: center;">Add Payment</h2>
	        <form id="addPaymentForm">
				<div class="filter-item">
				    <label for="customer-name">Select Customer</label>
					<select id="customer-name"  style="width: 100%; padding: 10px; border: 1px solid #ddd; border-radius: 4px;"></select>
				 </div>
	            <div style="margin-bottom: 15px;">
	                <label for="paymentAmt" style="display: block; margin-bottom: 5px;">Amount</label>
	                <input type="number" id="paymentAmt" name="paymentAmt" value="0" required style="width: 100%; padding: 10px; border: 1px solid #ddd; border-radius: 4px;">
	            </div>
	 
	            <div style="text-align: right;">
	                <button type="button" id="cancelBtn" style="margin-right: 10px; padding: 10px 20px; border: none; background-color: #ccc; border-radius: 5px; cursor: pointer;">
	                    Cancel
	                </button>
	                <button type="submit" style="padding: 10px 20px; background-color: #27ae60; color: white; border: none; border-radius: 5px; cursor: pointer;">
	                    Add
	                </button>
	            </div>
	        </form>
	    </div>
	</div>
</div>
<jsp:include page="url.jsp" />
<script>
    $(document).ready(function () {
		$('.spinner-container').show();
		$('#container').fadeIn();
        const table = $('#dieselReport').DataTable({
            columns: [
                { title: "ID" },
                { title: "Date" },
                { title: "Customer Name" },
				{ title: "Paid Amount" },
				{ title: "Total Due" }
              
            ],
			order: [[0, 'desc']]
        });

        $.ajax({
            url: prod_url+'/api/payment/getAll', // Adjust the endpoint URL if needed
            type: 'GET',
            dataType: 'json',
            success: function (data) {
                let totalAmt = 0;
                let totalVehicles = new Set();

                table.clear();

                data.forEach(function (record) {
					console.log(record);
                   totalAmt += Number(record.payment) || 0;;

                    // Track unique vehicles
                    totalVehicles.add(record.customerName);

                    table.row.add([
                        record.id,
                        record.payment_date || '',
                        record.customerName || '',
						record.payment || '',
						 ''
                    ]);
                });

                table.draw();
				$('.spinner-container').hide();
                // Update summary section
                $('#totalCustomers').text(totalVehicles.size);
                $('#totalProfit').text(totalAmt + ' RS');
				//$('#dieselReport tbody').on('click', 'tr', function() {
					//	const data = table.row(this).data();
					//	const customerName = data[2];
					//	window.location.href = 'paymentReport.jsp?customerName='+customerName;
				//});
            },
            error: function (xhr, status, error) {
                console.error("Error fetching records:", error);
            }
        });
		
		               $.ajax({
						        url: prod_url+'/api/order/getAll',
						        type: 'GET',
						        success: function (vehicles) {
						            const vehicleList = $('#customer-name');
									const customerList = $('#customer-name1');
						            vehicleList.empty();
						            vehicleList.append('<option value="">Select a Customer</option>');
									customerList.empty();
									customerList.append('<option value="">Select a Customer</option>');
						            vehicles.forEach(function (customer) {
						                const option = $('<option></option>').val(customer.id).text(customer.customer_name || '');
						                vehicleList.append(option);
										const option1 = $('<option></option>').val(customer.id).text(customer.customer_name || '');
										customerList.append(option1);
						            });
						        },
						        error: function (xhr, status, error) {
						            console.error("Error fetching vehicle data:", error);
						        }
						    });
		
		              $('#addPaymentBtn').on('click', function () {
				            $('#addPaymentModal').fadeIn();
				        });
						$('#viewCustomerBtn').on('click', function () {
							const customerName=  document.getElementById('customer-name1').options[document.getElementById('customer-name1').selectedIndex].text;
							if(customerName === 'Select a Customer' ){
								alert('Please Select Customer Name to view Due payments.');
							}else{
							window.location.href = 'paymentReport.jsp?customerName='+customerName;
							}
						});

				        // Hide the modal
				        $('#cancelBtn').on('click', function () {
				            $('#addPaymentModal').fadeOut();
				        });

				        // Handle form submission
				        $('#addPaymentForm').on('submit', function (e) {
				            e.preventDefault();
							
							

				            const dieselData = {
				               customerName:  document.getElementById('customer-name').options[document.getElementById('customer-name').selectedIndex].text,
				                amount: $('#paymentAmt').val()
				            };

							console.log(dieselData);
				            $.ajax({
				                url: prod_url+'/api/payment/add', // Adjust the endpoint URL if needed
				                type: 'POST',
				                contentType: 'application/json',
				                data: JSON.stringify(dieselData),
				                success: function (response) {
									console.log(response);
				                    alert(response);
				                    $('#addPaymentModal').fadeOut();
				                    $('#addPaymentForm')[0].reset();

				                    // Optionally, refresh the table
									window.location.reload();

				                },
				                error: function (xhr, status, error) {
				                    alert('Failed to add diesel record: ' + error);
				                }
				            });
				        });

    });
</script>

</body>
</html>