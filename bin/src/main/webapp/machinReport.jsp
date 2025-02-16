<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Machine and Driver Details</title>
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

        h2 {
            text-align: center;
            color: #4a76a8;
        }
		
		.btn-submit {
			padding: 10px 20px;
			           background-color: #2980b9;
			           color: white;
			           text-decoration: none;
			           border-radius: 5px;
		      }
			  
        .info-section {
            display: flex;
            justify-content: space-between;
            margin-bottom: 20px;
        }

        .info-box {
            flex: 1;
            padding: 10px;
            background-color: #eef2f7;
            border: 1px solid #dce1e8;
            border-radius: 5px;
            margin-right: 10px;
        }

        .info-box:last-child {
            margin-right: 0;
        }

        .info-box h3 {
            font-size: 16px;
            margin-bottom: 8px;
            color: #3d5a80;
        }

        .table-container {
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
		/* Overall page background when modal is active */
		body.modal-active {
		    overflow: hidden; /* Prevent scrolling when modal is open */
		}

		/* Modal backdrop */
		.modal-backdrop {
		    position: fixed;
		    top: 0;
		    left: 0;
		    width: 100%;
		    height: 100%;
		    background-color: rgba(0, 0, 0, 0.5); /* Semi-transparent black background */
		    z-index: 999; /* Make sure it's above other content */
		    display: none; /* Initially hidden */
		}

		/* Styling the modal container */
		#drModel.assign-driver-container {
		    width: 90%;
		    max-width: 400px;
		    padding: 25px 30px;
		    background-color: #fff;
		    border-radius: 12px;
		    box-shadow: 0 10px 30px rgba(0, 0, 0, 0.3);
		    position: fixed;
		    top: 50%;
		    left: 50%;
		    transform: translate(-50%, -50%); /* Centering the modal */
		    z-index: 1000; /* Make sure it's above the backdrop */
		    text-align: left;
		    transition: all 0.3s ease-in-out;
		    display: none; /* Initially hidden */
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

	    // Retrieve the driverId from the URL
	    const vType = getQueryParameter('vType');
	    const driverName = getQueryParameter('driverName');
		
		console.log(vType , driverName);
		$('#machin-number').text(driverName || 'No Name Provided'); 
		
		$(document).ready(function() {
		    // Initialize the modal and backdrop
		    $('#drModel').hide();
		    $('.modal-backdrop').hide();

		    // Display machine name
		    $('#machin-number').text(driverName || 'No Name Provided');

		    // Fetch drivers and display them
		    $.ajax({
		        url: prod_url+'/api/driver/getByMachineNumber?i=' + driverName,
		        type: 'GET',
		        success: function(drivers) {
		            if (drivers.length > 0) {
		                $('#driver1').text(drivers[0].driverName);
		                document.getElementById('btn1').style.display = 'flex'; // Show button for driver 1
		            }
		            if (drivers.length > 1) {
		                $('#driver2').text(drivers[1].driverName);
		                document.getElementById('btn2').style.display = 'flex'; // Show button for driver 2
		                document.getElementById('drbtn').style.display = 'none'; // Hide add button if two drivers
		            }
		        },
		        error: function(xhr, status, error) {
		            console.error("Error fetching vehicle data:", error);
		        }
		    });
			fetchAndAppendRecords();
		});

		// Show the modal
		function addDriver() {
		    $('#machineNumber').val(driverName); // Set the machine number
		    $('#drModel').show(); // Show the modal
		    $('.modal-backdrop').show(); // Show the backdrop

		    $.ajax({
		        url: prod_url+'/api/driver/getAll', // Adjust this URL to match your API endpoint
		        type: 'GET',
		        success: function(drivers) {
		            const driverList = $('#driverList'); // Target the select element
		            driverList.empty(); // Clear any previous options
		            driverList.append('<option value="">Select a driver</option>'); // Placeholder option

		            drivers.forEach(function(driver) {
		                const option = $('<option></option>').val(driver.id).text(driver.driverName);
		                driverList.append(option); // Append the option to the select element
		            });
		        },
		        error: function(xhr, status, error) {
		            console.error("Error fetching driver data:", error);
		        }
		    });
		}

		// Assign the selected driver
		function assignDriver() {
		    const selectedDriverId = $('#driverList').val(); // Get the selected driver ID
		    const machineNumber = $('#machineNumber').val(); // Get the machine number

		    if (selectedDriverId) {
		        // Perform the assignment logic here
		        console.log('Assigning driver ID ' + selectedDriverId + ' to machine ' + machineNumber);
				$.ajax({
					        url: prod_url+'/api/driver/assignDriver?mNumber='+machineNumber+'&DriverId='+selectedDriverId, // Adjust this URL to match your API endpoint
					        type: 'GET',
					        success: function(msg) {
					           alert(msg);
					        },
					        error: function(xhr, status, error) {
					            console.error("Error fetching driver data:", error);
								alert(error);
					        }
					    });
		        
		        $('#drModel').hide();
		        $('.modal-backdrop').hide();
		    } else {
		        alert('Please select a driver to assign.');
		    }
		}

		// Close modal on backdrop click
		$('.modal-backdrop').click(function() {
		    $('#drModel').hide();
		    $(this).hide();
		});

		function removeDriver(driverNumber) {
		    var selectedDriverId = '';
		    
		    if (driverNumber === 1) {
		        selectedDriverId = $('#driver1').text(); // Get the driver name (or ID if you're storing it)
		    }
		    if (driverNumber === 2) {
		        selectedDriverId = $('#driver2').text(); // Get the driver name (or ID if you're storing it)
		    }
		    
		    console.log("Selected Driver: " + selectedDriverId);
		    
		    // Now, make an AJAX call to remove the driver from the server
		    $.ajax({
		        url: prod_url+'/api/driver/remove?DriverName='+selectedDriverId, // Replace with your API endpoint for removal
		        type: 'GET',
		        success: function(response) {
		            console.log( response);
		            // Optionally update the UI to reflect the removal
		            if (driverNumber === 1) {
		                $('#driver1').text('....'); // Clear the driver name
		                $('#btn1').hide(); // Hide the remove button
		            }
		            if (driverNumber === 2) {
		                $('#driver2').text('....'); // Clear the driver name
		                $('#btn2').hide(); // Hide the remove button
		            }
		        },
		        error: function(xhr, status, error) {
		            console.error("Error removing driver:", error);
		        }
		    });
		}
		
		function fetchAndAppendRecords() {
		    // Initialize DataTable if not already initialized
		    const table = $('#readingTable').DataTable({
		        columns: [
		            { title: "ID" },
		            { title: "Date" },
		            { title: "Start Reading" },
		            { title: "End Reading" },
		            { title: "Total Hours" },
		            { title: "Maintenance" },
					{ title: "Disel" },
		            { title: "Updated By" }
		        ]
		    });

		    // Fetch the machine number value from the element
		    let machinN = $('#machin-number').text();

		    // Make the AJAX request to fetch records
		    $.ajax({
		        url: prod_url+'/vehicle/getRecords?machinN=' + machinN, // Adjust the endpoint URL if needed
		        type: 'GET',
		        dataType: 'json',
		        success: function (data) {
					console.log(data);
		            // Clear the table before adding new rows
		            table.clear();

		            // Loop through each record and add it to the table
		            data.forEach(function (record) {

		                let totalHours = calculateTotalHours(record.startReading, record.endReading); // Assuming this function exists

		                table.row.add([
		                    record.id,
		                    record.date || '',
		                    record.startReading || '',
		                    record.endReading || '',
		                    totalHours || '',
		                    record.maintenance || '',
							record.diesel || '',
		                    record.driverName || ''
		                ]);
		            });

		            // Draw the table after all rows are added
		            table.draw();
					if(vType === 'Dumper'){
							$('.table-container').hide();	
					}
					$('#readingTable tbody').on('click', 'tr', function() {
											                           const data = table.row(this).data();
											                           const vId = data[0]; // Assuming ID is in the first col
											                           window.location.href = 'approveCount.jsp?rowId='+vId;
											                       });
																   
		        },
		        error: function (xhr, status, error) {
		            console.error("Error fetching records:", error);
		        }
		    });
		}
		   // Sample function to calculate total hours (adjust logic as needed)
		   function calculateTotalHours(start, end) {
		       if (start && end) {
		           return end - start; // Simple difference (customize based on your logic)
		       }
		       return 'N/A';
		   }

	    
	   </script>
</head>
<body>

	<div class="container">
	    <h2>Machine and Driver Details</h2>

	    <div class="info-section">
	        <div class="info-box">
	            <h3>Machine Number</h3>
	            <span id="machin-number">Loading....</span> <!-- Replace with dynamic data as needed -->
	        </div>

	        <div class="info-box">
	            <h3>Related Drivers</h3>
	            <p>Driver 1: <span id="driver1">.......</span> <button id="btn1" class="btn-submit" onclick="removeDriver(1)">Remove</button></p>
	            <p>Driver 2: <span id="driver2">.......</span> <button id="btn2"  class="btn-submit" onclick="removeDriver(2)">Remove</button></p>
	            <!-- Button to add a new driver -->
	            <button id="drbtn" class="btn-submit" onclick="addDriver()">Add Driver</button>
	        </div>
	    </div>

	    <div class="table-container">
	        <h3>Machine Reading Table</h3>
			<table id="readingTable">
			    <thead>
			        <tr>
			            <th>ID</th>
			            <th>Date</th>
			            <th>Start Reading</th>
			            <th>End Reading</th>
			            <th>Maintenance</th>
						<th>Disel</th>
			            <th>Total Hours</th>
			            <th>Updated By</th>
			        </tr>
			    </thead>
			    <tbody>
			        <!-- Rows will be dynamically appended here by DataTable -->
			    </tbody>
			</table>

	    </div>
		<div class="modal-backdrop"></div> <!-- Optional backdrop for the modal -->

		<div id="drModel" class="assign-driver-container">
		    <h3>Assign Driver to Machine</h3>
		    
		    <label for="machineNumber">Machine Number</label>
		    <input type="text" id="machineNumber" />

		    <label for="driverList">Driver Name</label>
		    <select id="driverList">
		        <!-- Driver options will be dynamically appended -->
		    </select>
		    
		    <button id="assignDriverButton"  onclick="assignDriver()" >Assign Driver</button>
		</div>


	</div>


</body>
</html>
