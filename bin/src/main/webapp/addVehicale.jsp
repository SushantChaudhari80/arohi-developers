<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Add Vehicle</title>
    <link href="https://fonts.googleapis.com/css2?family=Poppins:wght@300;400;500;600&display=swap" rel="stylesheet">
    <style>
        * {
            margin: 0;
            padding: 0;
            box-sizing: border-box;
        }

        body, html {
            font-family: 'Poppins', sans-serif;
            background-color: #f4f6f9;
            color: #2C3E50;
        }

        .container {
            max-width: 800px;
            margin: 50px auto;
            padding: 20px;
            background-color: white;
            box-shadow: 0 2px 10px rgba(0, 0, 0, 0.1);
            border-radius: 10px;
        }

        h1 {
            text-align: center;
            font-size: 28px;
            font-weight: 500;
            margin-bottom: 30px;
        }

        .form-group {
            display: flex;
            flex-direction: column;
            margin-bottom: 20px;
        }

        label {
            font-size: 16px;
            font-weight: 500;
            margin-bottom: 8px;
        }

        input[type="text"] {
            padding: 12px;
            border: 1px solid #ddd;
            border-radius: 5px;
            font-size: 16px;
            transition: border-color 0.3s ease;
        }

        input[type="text"]:focus {
            outline: none;
            border-color: #2980b9;
        }

        .form-group.inline {
            display: grid;
            grid-template-columns: 1fr 1fr;
            gap: 20px;
        }

        button {
            padding: 12px;
            background-color: #2980b9;
            color: white;
            font-size: 16px;
            border: none;
            border-radius: 5px;
            cursor: pointer;
            transition: background-color 0.3s ease;
        }

        button:hover {
            background-color: #3498db;
        }

        .form-group.inline button {
            grid-column: span 2;
            justify-self: center;
        }

        /* Success message */
        .success-message {
            display: none;
            padding: 15px;
            background-color: #2ecc71;
            color: white;
            border-radius: 5px;
            text-align: center;
            margin-top: 20px;
        }

        /* Error message */
        .error-message {
            display: none;
            padding: 15px;
            background-color: #e74c3c;
            color: white;
            border-radius: 5px;
            text-align: center;
            margin-top: 20px;
        }

        /* Responsive Design */
        @media (max-width: 768px) {
            .form-group.inline {
                grid-template-columns: 1fr;
            }

            button {
                width: 100%;
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
</head>
<body>

<div class="container">
    <h1>Add New Vehicle</h1>
    
    <form id="addVehicleForm" action="/addVehicale">
        <div class="form-group inline">
            <div>
                <label for="machine_number">Machine Number</label>
                <input type="text" id="machine_number" name="machine_number" placeholder="Enter machine number">
            </div>
            <div>
                <label for="company">Company</label>
                <input type="text" id="company" name="company" placeholder="Enter company name">
            </div>
			<div>
			    <label for="v_type">Vehicale Type</label>
				<select id="v_type">
					<option value="Excavator">Excavator</option> 
					<option value="Dumper">Dumper</option> 
				</select>
			</div>			
        </div>

        <div class="form-group inline">
            <button type="submit">Add Vehicle</button>
        </div>

        <div class="success-message" id="successMessage">
            Vehicle added successfully!
        </div>
        <div class="error-message" id="errorMessage">
            Error adding vehicle. Please try again.
        </div>
    </form>
</div>
<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
<jsp:include page="url.jsp" />
<script>
    // Simple JavaScript to handle form submission (placeholder, adjust as needed)
    document.getElementById('addVehicleForm').addEventListener('submit', function(event) {
    event.preventDefault(); // Prevent form from submitting normally
	$('.spinner-container').show();
    const machineNumber = document.getElementById('machine_number').value;
    const company = document.getElementById('company').value;
    const v_type =  $('#v_type option:selected').text();
    $.ajax({
        url: prod_url+'/api/vehicles/add',  // URL for adding the vehicle
        type: 'POST',
        contentType: 'application/json',
        data: JSON.stringify({
            machineNumber: machineNumber,
            company: company,
			v_type: v_type
        }),
        success: function(msg) {
			console.log(msg);
            if (msg === "Vehicle added successfully!") {
                // Display success message
                document.getElementById('successMessage').style.display = 'block';
                document.getElementById('errorMessage').style.display = 'none';
            } else {
                // Display error message
                document.getElementById('successMessage').style.display = 'none';
                document.getElementById('errorMessage').style.display = 'block';
            }
			$('.spinner-container').hide();
        },
        error: function(xhr, status, error) {
            console.error("Error adding vehicle:", error);
            // Display error message
            document.getElementById('successMessage').style.display = 'none';
            document.getElementById('errorMessage').style.display = 'block';
        }
    });
});

</script>

</body>
</html>
