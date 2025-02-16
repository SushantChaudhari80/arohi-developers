<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Invoices</title>
    <link href="https://fonts.googleapis.com/css2?family=Poppins:wght@400;500&display=swap" rel="stylesheet">
    <style>
        body {
            font-family: 'Poppins', sans-serif;
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
            display: none;
            justify-content: space-between;
            margin-bottom: 20px;
            flex-wrap: wrap;
        }

        .filters .filter-item {
            display: flex;
            flex-direction: column;
            margin-right: 15px;
            margin-bottom: 15px;
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
        
        .actions {
            display: flex;
            justify-content: flex-end;
            margin-bottom: 20px;
        }

        .actions button {
            background-color: #34495e;
            color: white;
            padding: 10px 20px;
            border: none;
            border-radius: 5px;
            cursor: pointer;
            margin-left: 10px;
        }

        .actions button:hover {
            background-color: #2c3e50;
        }
    </style>
	<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>

	<!-- Include DataTables CSS -->
	<link rel="stylesheet" href="https://cdn.datatables.net/1.13.5/css/jquery.dataTables.min.css">

	<!-- Include DataTables JavaScript -->
	<script src="https://cdn.datatables.net/1.13.5/js/jquery.dataTables.min.js"></script>
	<jsp:include page="url.jsp" />
	<script>
	
		$(document).ready(function () {
		    const table = $('#invoiceTable').DataTable({
		        columns: [
		            { title: "Invoice ID" },
		            { title: "Billed Date" },
		            { title: "Invoice content" },
		            { title: "Actions" }
		        ],
				order: [[2, 'desc']]
		    });

		    $.ajax({
		        url: prod_url+'/api/invoice/getAllInvoice', // URL for fetching invoice data
		        type: 'GET',
		        success: function(invoices) {
		            table.clear(); // Clear existing 
		            // Loop through each invoice and add it to the DataTable
		            invoices.forEach(function(invoice) {
						console.log(invoice);
		                table.row.add([
		                    invoice.id || '',              // Ensure fallback value if undefined
		                    invoice.billedDate || '',      // Correct property name for billedDate
		                    'Click here',             // Convert HTML content to plain text
		                    'N/A'                          // Placeholder for actions column
		                ]);
		            });

		            table.draw(false); // Draw the table once all rows are added

		            // Attach event handler for row click (after DataTable has been populated)
		            $('#invoiceTable tbody').on('click', 'tr', function() {
		                const data = table.row(this).data();
		                const invoiceId = data[0]; // Assuming the first column is the invoice ID
						
						$.ajax({
							 url: prod_url+'/api/invoice/getById/'+invoiceId,
							 type: 'GET',
							 success: function (msg) {
								const printWindow = window.open('', '_blank');
										printWindow.document.write(msg); // You can write more details here if needed
										printWindow.document.close();
										 printWindow.print();
							},
							error: function (xhr, status, error) {
									 console.error("Error saving invoice:", error);
									 alert("Failed to save invoice. Please try again.");
									 $('.spinner-container').hide(); // Hide spinner on error
								}
							});	

		                
		            });
					$('.spinner-container').hide(); // Hide the spinner after data is loaded
		        },
		        error: function(xhr, status, error) {
		            console.error("Error fetching invoice data:", error);
		            $('.spinner-container').hide(); // Hide the spinner on error
		        }
		    });
		});

		// Function to convert HTML content to plain text
		



		   


	</script>
	
</head>
<body>


        <!-- Invoices Table -->
        <table  id="invoiceTable" class="display">
            <thead>
                <tr>
                    <th>Invoice ID</th>
                    <th>Billed Date</th>
					<th id="content">Invoice content</th>
                    <th>Actions</th>
                </tr>
            </thead>
            <tbody>
             
            </tbody>
        </table>
    </div>

    <script>

    </script>

</body>
</html>
