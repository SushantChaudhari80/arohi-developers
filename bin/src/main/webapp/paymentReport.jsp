<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Payment History</title>
    <style>
        body {
			
			font-family: Arial, sans-serif;
            margin: 20px;
        }
        h1, h2 ,h3 {
            text-align: center;
        }
        table {
            width: 100%;
            border-collapse: collapse;
            margin: 20px 0;
        }
        th, td {
            border: 1px solid #ddd;
            padding: 8px;
            text-align: left;
        }
        th {
            background-color: #2980b9;
            color: white;
        }
        .container {
            max-width: 1200px;
            margin: auto;
        }
        #totalPayment {
            color: #2980b9;
            font-weight: bold;
        }
    </style>
    <!-- Include jQuery -->
    <script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
	<link rel="stylesheet" href="https://cdn.datatables.net/1.13.5/css/jquery.dataTables.min.css">
	 <script src="https://cdn.datatables.net/1.13.5/js/jquery.dataTables.min.js"></script>
	 <jsp:include page="url.jsp" />
</head>
<body>
    <div class="container">
		<h1><span id="customerName">..</span></h1>
        <h3>Total Payment: <span id="totalPayment">0</span></h3>
		<h3>Total Paid: <span id="totalPaid">0</span></h3>
		<h3>Due Amount: <span id="duePayment">0</span></h3>
		<div id="mReport">
	        <h2>Machine Report</h2>
	        <table id="table1">
	            <thead>
	                <tr>
	                    <th>ID</th>
	                    <th>Date</th>
	                    <th>Customer Name</th>
	                    <th>Machine Number</th>
	                    <th>Total Hours</th>
	                    <th>Rate</th>
	                    <th>Total Payment</th>
	                </tr>
	            </thead>
	            <tbody></tbody>
	        </table>
       </div>
	   <div id="dReport">
	        <h2>Dumper Payment</h2>
	        <table id="table2">
	            <thead>
	                <tr>
	                    <th>ID</th>
	                    <th>Date</th>
	                    <th>Customer Name</th>
	                    <th>Dumper Number</th>
	                    <th>Treep/Brass</th>
	                    <th>Rate</th>
	                    <th>Total Payment</th>
	                </tr>
	            </thead>
	            <tbody></tbody>
	        </table>
		</div>
		<div id="pReport">
			<h2>Payment History</h2>
			        <table id="table3">
			            <thead>
			                <tr>
			                    <th>ID</th>
			                    <th>Date</th>
			                    <th>Customer Name</th>
			                    <th>Paid Amount</th>
			                </tr>
			            </thead>
			            <tbody></tbody>
			        </table>
		</div>		
    </div>

    <script>
		function getQueryParameter(param) {
				        const urlParams = new URLSearchParams(window.location.search);
				        return urlParams.get(param);
				    }
  
	 function getTotalDue(){
		let totalBilled = parseFloat($('#totalPayment').text()); // Correct the selector and parse to a float
				let totalPaid = parseFloat($('#totalPaid').text()); // Parse to a float

				console.log(totalBilled);
				console.log(totalPaid);
				let duePayment = (totalBilled - totalPaid).toFixed(2);

				// Update the duePayment span with the calculated value
				$('#duePayment').text(duePayment);
				if (duePayment >= 0) {
				    $('#duePayment').css('color', 'green'); // Set color to green for positive or zero
				} else {
				    $('#duePayment').css('color', 'red'); // Set color to red for negative
				}
	 }
	 
        // Use jQuery to execute the code when the document is ready
        $(document).ready(function () {
			setTimeout(function () {
			        getTotalDue();
			    }, 3000); 
			const table1 = $('#table1').DataTable({
			          columns: [
			              { title: "ID" },
			              { title: "Date" },
			              { title: "Customer Name" },
						{ title: "Machine Number" },
						{ title: "Total Hours" },
						{ title: "Rate" },
						{ title: "Total Payment" }
			            
			          ]
			      });
				  const table2 = $('#table2').DataTable({
				  			          columns: [
				  			              { title: "ID" },
				  			              { title: "Date" },
				  			              { title: "Customer Name" },
				  						{ title: "Dumper Number" },
				  						{ title: "Treep/Brass" },
				  						{ title: "Rate" },
				  						{ title: "Total Payment" }
				  			            
				  			          ]
				  			      });
					const table3 = $('#table3').DataTable({
							columns: [
								  	{ title: "ID" },
								  	{ title: "Date" },
								  	{ title: "Customer Name" },
								  	{ title: "Paid Amount" }
								  ]
						});
            // AJAX call to fetch data
			const customerName = getQueryParameter('customerName');
			$('#customerName').text(customerName);
			
            $.ajax({
                url: prod_url+'/api/payment/getAll/byCustomerName?cName='+customerName,
                type: 'GET',
                dataType: 'json',
                success: function (data) {
                    // Destructure data into two arrays
                    const [table1Data, table2Data] = data;

                    let totalPaymentSum = 0;

                    // Populate Table 1
                    let table1Total = 0;
					table1.clear();
					if (table1Data.length > 0) {
					    table1Data.forEach(function (item) {
					        table1.row.add([
					            item.id,
					            item.date || '',
					            item.customer_name || '',
					            item.v_number || '',
					            item.total || '',
					            item.end_reading || '',
					            item.total_payment || '',
					        ]);
					        table1Total += parseFloat(item.total_payment);
					    });
					    table1.draw();
					    $('#mReport').show();
					} else {
					    $('#mReport').hide();
					}

					table1.draw();
                    // Populate Table 2
                    let table2Total = 0;
					if (table2Data.length > 0) {
                    table2Data.forEach(function (item) {
						table2.row.add([
								item.id,
								item.date || '',
								item.customer_name || '',
								item.v_number || '',
								item.total || '',
								item.rate || '',
								item.total_payment || '',
							]);
                        table2Total += parseFloat(item.total_payment);
						table2.draw();
						$('#dReport').show();
                    });
					}else{
						$('#dReport').hide();
					}
					
                    // Calculate and display the total payment sum
                    totalPaymentSum = table1Total + table2Total;
					totalBilled = totalPaymentSum;
                    $('#totalPayment').text(totalPaymentSum.toFixed(2));
                },
                error: function (xhr, status, error) {
                    console.error('Error fetching data:', error);
                }
            });
			$.ajax({
			                url: prod_url+'/api/payment/getAll/payments/byCustomerName?cName='+customerName,
			                type: 'GET',
			                dataType: 'json',
			                success: function (data) {
								let table3Total = 0;
								console.log(data);
								table3.clear();
								if(data.length > 0 ){
								data.forEach(function (item) {
								table3.row.add([
									item.id,
									item.payment_date || '',
									item.customerName || '',
									item.payment || '',
								]);
								table3Total += parseFloat(item.payment);   
								});
								table3.draw();
								$('#pReport').show();
								}else{
									$('#pReport').hide();
								}
								totalPaid=table3Total;
								$('#totalPaid').text(table3Total.toFixed(2));
								
							},
							error: function (xhr, status, error) {
								console.error('Error fetching data:', error);
						   }
			});
		

        });
    </script>
</body>
</html>
