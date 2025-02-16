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
		        ],
				order: [[2, 'desc']]
		    });

		    // Fetch and populate vehicle data into the table
		    $.ajax({
		        url: prod_url+'/vehicle/getAll/billed', // Adjust the endpoint URL if needed
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

					$('#selectAll').on('change', function () {
					           const isChecked = this.checked;
					           $('.row-checkbox').prop('checked', isChecked);
					       });

		});

	</script>
</head>
<body>

    <div class="container">
        <h1>Billed Reading Report</h1>

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
