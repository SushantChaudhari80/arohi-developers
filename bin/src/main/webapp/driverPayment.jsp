<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Driver Payment Page</title>
    <link href="https://fonts.googleapis.com/css2?family=Roboto:wght@400;500&display=swap" rel="stylesheet">
    <style>
        body {
            font-family: 'Roboto', sans-serif;
            background-color: #f4f7fa;
            margin: 0;
            padding: 20px;
            color: #333;
        }

        .container {
            max-width: 900px;
            margin: 0 auto;
            background: #fff;
            border-radius: 8px;
            box-shadow: 0 2px 10px rgba(0, 0, 0, 0.1);
            padding: 20px;
        }

        h2, h1 {
            text-align: center;
            color: #4a76a8;
        }

        .btn {
            padding: 10px 20px;
            background-color: #2980b9;
            color: white;
            text-decoration: none;
            border-radius: 5px;
            display: inline-block;
        }

        .btn:hover {
            background-color: #3498db;
        }

        .btn-primary {
            background-color: #2980b9;
            color: white;
        }

        .page-header {
            display: flex;
            justify-content: space-between;
            align-items: center;
            margin-bottom: 20px;
        }

        .filters {
            display: flex;
            justify-content: space-between;
            margin-bottom: 20px;
            padding: 15px;
            background-color: #eef2f7;
            border-radius: 5px;
            box-shadow: 0 2px 10px rgba(0, 0, 0, 0.05);
        }

        .filters input[type="text"], .filters input[type="date"] {
            padding: 10px;
            border: 1px solid #ddd;
            border-radius: 5px;
            width: 200px;
        }

        .filters .btn-filter {
            padding: 10px 15px;
            background-color: #27ae60;
            color: white;
            border: none;
            border-radius: 5px;
            cursor: pointer;
        }

        .filters .btn-filter:hover {
            background-color: #2ecc71;
        }

        .payment-table {
            margin-top: 20px;
            overflow-x: auto;
        }

        table {
            width: 100%;
            border-collapse: collapse;
            margin-top: 10px;
        }

        th, td {
            padding: 12px 15px;
            text-align: left;
            border: 1px solid #ddd;
        }

        th {
            background-color: #4a76a8;
            color: #fff;
        }

        tr:nth-child(even) {
            background-color: #f9fafb;
        }

        .payment-summary {
            margin-top: 30px;
            background-color: #eef2f7;
            padding: 20px;
            border-radius: 5px;
            box-shadow: 0 2px 10px rgba(0, 0, 0, 0.05);
        }

        .payment-summary h3 {
            font-size: 20px;
            margin-bottom: 15px;
        }

        .payment-summary p {
            font-size: 16px;
            margin-bottom: 10px;
        }

        #totalPayments, #totalAmount {
            font-weight: bold;
            color: #27ae60;
        }
		body {
		            font-family: 'Roboto', sans-serif;
		            background-color: #f4f7fa;
		            margin: 0;
		            padding: 20px;
		            color: #333;
		        }

		        .container {
		            max-width: 900px;
		            margin: 0 auto;
		            background: #fff;
		            border-radius: 8px;
		            box-shadow: 0 2px 10px rgba(0, 0, 0, 0.1);
		            padding: 20px;
		        }

		        h1 {
		            text-align: center;
		            color: #4a76a8;
		        }

		        .btn {
		            padding: 10px 20px;
		            background-color: #2980b9;
		            color: white;
		            text-decoration: none;
		            border-radius: 5px;
		            display: inline-block;
		        }

		        .btn:hover {
		            background-color: #3498db;
		        }

		        /* Modal styles */
		        .modal {
		            display: none;
		            position: fixed;
		            z-index: 1;
		            left: 0;
		            top: 0;
		            width: 100%;
		            height: 100%;
		            overflow: auto;
		            background-color: rgba(0, 0, 0, 0.4);
		        }

		        .modal-content {
		            background-color: #fff;
		            margin: 15% auto;
		            padding: 20px;
		            border: 1px solid #888;
		            width: 400px;
		            border-radius: 8px;
		        }

		        .modal-header {
		            display: flex;
		            justify-content: space-between;
		            align-items: center;
		        }

		        .close {
		            color: #aaa;
		            font-size: 28px;
		            font-weight: bold;
		            cursor: pointer;
		        }

		        .close:hover {
		            color: #000;
		        }

		        .form-group {
		            margin-bottom: 15px;
		        }

		        .form-group label {
		            display: block;
		            margin-bottom: 5px;
		        }

		        .form-group input {
		            width: 100%;
		            padding: 10px;
		            border: 1px solid #ddd;
		            border-radius: 5px;
		        }

		        .modal-footer {
		            text-align: right;
		        }

		        .btn-submit {
		            background-color: #27ae60;
		            color: white;
		            border: none;
		            padding: 10px 20px;
		            border-radius: 5px;
		        }

		        .btn-submit:hover {
		            background-color: #2ecc71;
		        }
    </style>
    <!-- Include jQuery -->
    <script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>

    <!-- Include DataTables CSS -->
    <link rel="stylesheet" href="https://cdn.datatables.net/1.13.5/css/jquery.dataTables.min.css">

    <!-- Include DataTables JavaScript -->
    <script src="https://cdn.datatables.net/1.13.5/js/jquery.dataTables.min.js"></script>
	<jsp:include page="url.jsp" />
    <script>
        // Function to retrieve query parameters from URL
        function getQueryParameter(param) {
            const urlParams = new URLSearchParams(window.location.search);
            return urlParams.get(param);
        }
		

		$(document).ready(function() {
		    // Retrieve the driverId and driverName from the URL
		    const driverId = getQueryParameter('driverId');
		    const driverName = getQueryParameter('driverName');
		    console.log(driverId, driverName);
			
			const table = $('#paymenTable').DataTable({
				        columns: [
				            { title: "Payment ID" },
				            { title: "Driver Name" },
				            { title: "Date" },
				            { title: "Amount" }
				        ]
				    });
					
					$.ajax({
					            url: prod_url+'/api/driver/payment/getAll?driverName='+driverName, // Replace with your API endpoint for removal
						        type: 'GET',
						        success: function(records) {
									console.log(records);
									table.clear();
										            records.forEach(function (record) {
										                table.row.add([
										                    record.id,
										                    record.driverName || '',
										                    record.date || '',
										                    record.amount || ''
										                ]);
										            });

										            // Draw the table after all rows are added
										            table.draw();	
													$('#totalPayments').text(records.length);	
													const totalAmount = records.reduce((sum, record) => {
													            return sum + (parseFloat(record.amount) || 0); // Convert amount to number
													        }, 0);
																$('#totalAmount').text(totalAmount);				
						          },
							      error: function(xhr, status, error) {
								      console.error("Error removing driver:", error);
							      }
					 });		

		    // Update the driverInfo span with the driverName
		    $('#driverInfo').text(driverName);
		    
		    // Event listener for opening the modal
		    $('#addPaymentBtn').on('click', function () {
		        $('#addPaymentModal').fadeIn();  // Show the modal
		    });

		    // Close modal when 'x' or anywhere outside the modal content is clicked
		    $('.close').on('click', function () {
		        $('#addPaymentModal').fadeOut();  // Hide the modal
		    });

		    $(window).on('click', function (e) {
		        if ($(e.target).is('#addPaymentModal')) {
		            $('#addPaymentModal').fadeOut();  // Hide the modal if clicked outside
		        }
		    });

		    // Handle form submission
		    $('#paymentForm').on('submit', function (e) {
		        e.preventDefault();
		        const amount = $('#paymentAmount').val();
		        
		        // Log the data or perform AJAX request to save payment details
		        console.log('Payment Submitted:', { driverName, amount });
				$.ajax({
					        url: prod_url+'/api/driver/payment/save?driverName='+driverName+'&amount='+amount, // Replace with your API endpoint for removal
					        type: 'GET',
					        success: function(response) {
								alert(response);
								$(this).trigger('reset');
								$('#addPaymentModal').fadeOut();
					        },
					        error: function(xhr, status, error) {
					            console.error("Error removing driver:", error);
					        }
					    });
		    });
		});


    </script>
</head>
<body>
    <div class="container">
        <h1>Driver Payment Management</h1>

        <div class="page-header">
			<div>
			    <label for="driverInfo">Driver Name :</label>
			    <span id="driverInfo"></span>
			</div>

            <button id="addPaymentBtn" class="btn btn-primary">Add Payment</button>
        </div>

        <div class="filters">
            <input type="text" id="driverName" placeholder="Search by Driver Name">
            <input type="date" id="startDate" placeholder="Start Date">
            <input type="date" id="endDate" placeholder="End Date">
            <button class="btn-filter">Apply Filters</button>
        </div>

        <div class="payment-table">
            <table id="paymenTable">
                <thead>
                    <tr>
                        <th>Payment ID</th>
                        <th>Driver Name</th>
                        <th>Date</th>
                        <th>Amount</th>
                    </tr>
                </thead>
                <tbody>
                    <!-- Payment records will be inserted here -->
                </tbody>
            </table>
        </div>

        <div class="payment-summary">
            <h3>Payment Summary</h3>
            <p>Total Payments: <span id="totalPayments">0</span></p>
            <p>Total Amount: <span id="totalAmount">$0.00</span></p>
        </div>
    </div>
	<div id="addPaymentModal" class="modal">
	        <div class="modal-content">
	            <div class="modal-header">
	                <h3>Add Payment</h3>
	                <span class="close">&times;</span>
	            </div>

	            <form id="paymentForm">
	                <div class="form-group">
	                    <label for="paymentAmount">Amount</label>
	                    <input type="number" id="paymentAmount" name="paymentAmount" required>
	                </div>

	                <div class="modal-footer">
	                    <button type="submit" class="btn-submit">Submit Payment</button>
	                </div>
	            </form>
	        </div>
	    </div>
</body>
</html>
