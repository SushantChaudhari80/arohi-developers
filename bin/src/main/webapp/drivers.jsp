<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Drivers Page</title>
    <link href="https://fonts.googleapis.com/css2?family=Poppins:wght@300;400;500;600&display=swap" rel="stylesheet">
    <style>
        * {
            margin: 0;
            padding: 0;
            box-sizing: border-box;
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
            cursor: pointer;
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

        /* Drivers Grid */
        .drivers-grid {
            display: grid;
            grid-template-columns: repeat(auto-fit, minmax(250px, 1fr));
            gap: 20px;
        }

        .driver-card {
            background-color: #fff;
            border-radius: 8px;
            box-shadow: 0 2px 10px rgba(0, 0, 0, 0.1);
            overflow: hidden;
            padding: 20px;
            text-align: center;
            transition: transform 0.3s;
        }

        .driver-card:hover {
            transform: translateY(-5px);
        }

        .driver-card img {
            border-radius: 50%;
            width: 80px;
            height: 80px;
            margin-bottom: 10px;
        }

        .driver-card h3 {
            font-size: 20px;
            margin-bottom: 10px;
        }

        .driver-card p {
            color: #7f8c8d;
            margin-bottom: 15px;
        }

        .driver-status {
            padding: 5px 10px;
            border-radius: 4px;
            font-size: 14px;
            text-align: center;
            display: inline-block;
        }

        .status-available {
            background-color: #2ecc71;
            color: white;
        }

        .status-on-duty {
            background-color: #f39c12;
            color: white;
        }

        .status-off-duty {
            background-color: #e74c3c;
            color: white;
        }

        /* Modal for Driver Details */
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
	<jsp:include page="url.jsp" />
	<script>
	    $(document).ready(function() {
	        $('.spinner-container').show();

	        // Initialize DataTable when the document is ready
	        const table = $('#driverTable').DataTable({
	            columns: [
	                { title: "ID" },
	                { title: "Driver Name" },
	                { title: "Driver Mobile" },
	                { title: "Driver Address" },
	                { title: "Driver Aadhar" },
					{ title: "Driver DL Number"}
	                
	            ]
	        });

	        // Function to fetch vehicle data from server using AJAX
	        function fetchVehiclesList() {
	            $.ajax({
	                url: prod_url+'/api/driver/getAll', // URL for fetching vehicle data
	                type: 'GET',
	                success: function(drivers) {
	                    table.clear(); // Clear existing rows
	                    console.log(drivers);

	                    // Loop through each vehicle and add it to the DataTable
	                    drivers.forEach(function(driver) {
	                        table.row.add([
	                            driver.id || '',              // Ensure fallback value if undefined
	                            driver.driverName || '',   // Replace with the correct property name if different
	                            driver.driverMobile || '',
	                            driver.driverAddress || '',
	                            driver.driverAadhar || '',
								driver.driverLiencense || 'N/A'// Use 'N/A' or another placeholder if undefined
	                        ]);
	                    });

	                    table.draw(false); // Draw the table once all rows are added
	                    // Add click event to rows
                        $('#driverTable tbody').on('click', 'tr', function() {
                            const data = table.row(this).data();
                            const driverId = data[0]; // Assuming ID is in the first column
                            const driverName = data[1];
                            window.location.href = 'driverPayment.jsp?driverId='+driverId+'&driverName='+driverName;
                        });
						$('.spinner-container').hide();
	                },
	                error: function(xhr, status, error) {
	                    console.error("Error fetching Driver data:", error);
	                    $('.spinner-container').hide(); // Hide the spinner on error as well
	                }
	            });
	        }

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
            <h1>Drivers</h1>
            <a href="addDriver.jsp" class="btn">Add New Driver </a>
        </div>

        <!-- Filters Section -->
        <div class="filters">
            <select>
                <option value="">Filter by Status</option>
                <option value="available">Available</option>
                <option value="on-duty">On Duty</option>
                <option value="off-duty">Off Duty</option>
            </select>
            <input type="text" placeholder="Search by Driver Name">
            <button>Apply Filters</button>
        </div>

        <!-- Table HTML structure -->
		<table id="driverTable" class="display">
		    <thead>
		        <tr>
		            <th>ID</th>
		            <th>Driver Name</th>
		            <th>Driver Mobile</th>
		            <th>Driver Address</th>
		            <th>Driver Aadhar</th>
					<th>Driver DL Number</th>
		        </tr>
		    </thead>
		    <tbody>
		        <!-- Rows will be dynamically added here -->
		    </tbody>
		</table>

        <!-- Modal for Driver Details -->
        <div class="modal" id="driverModal">
            <div class="modal-content">
                <span class="modal-close" onclick="closeModal()">x</span>
                <div class="modal-header">
                    <h2>Driver Details</h2>
                </div>
                <div class="modal-body">
                    <p>Name: Driver 01</p>
                    <p>Vehicle Assigned: Truck 01</p>
                    <p>Status: Available</p>
                    <p>Last Trip: 2024-09-12</p>
                    <p>Contact: +123456789</p>
                </div>
            </div>
        </div>

    </div>

    <!-- JavaScript for Modal -->
    <script>
        function openModal(driverName) {
            document.getElementById('driverModal').style.display = 'flex';
            document.querySelector('.modal-header h2').innerText = driverName + ' Details';
        }

        function closeModal() {
            document.getElementById('driverModal').style.display = 'none';
        }
    </script>

</body>
</html>
