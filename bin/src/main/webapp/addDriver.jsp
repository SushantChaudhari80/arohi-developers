<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Add Driver</title>
    <link href="https://fonts.googleapis.com/css2?family=Poppins:wght@300;400;500;600&display=swap" rel="stylesheet">
    <style>
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
        body, html {
            font-family: 'Poppins', sans-serif;
            background-color: #f0f4f8;
            color: #2C3E50;
            margin: 0;
            padding: 0;
        }

        .container {
            max-width: 800px;
            margin: 50px auto;
            padding: 20px;
            background-color: #fff;
            border-radius: 10px;
            box-shadow: 0 4px 10px rgba(0, 0, 0, 0.1);
        }

        .page-header {
            text-align: center;
            margin-bottom: 30px;
        }

        .page-header h1 {
            font-size: 32px;
            font-weight: 600;
            color: #3498db;
        }

        .form-group {
            margin-bottom: 20px;
        }

        .form-group label {
            display: block;
            font-weight: 500;
            margin-bottom: 8px;
            color: #34495e;
        }

        .form-group input, 
        .form-group textarea {
            width: 100%;
            padding: 12px;
            border: 1px solid #ddd;
            border-radius: 5px;
            font-size: 16px;
            color: #34495e;
            background-color: #f9f9f9;
            transition: border-color 0.3s;
        }

        .form-group input:focus, 
        .form-group textarea:focus {
            border-color: #3498db;
            background-color: #fff;
        }

        .form-group textarea {
            resize: vertical;
            height: 120px;
        }

        .btn-submit {
            display: block;
            width: 100%;
            padding: 15px;
            font-size: 18px;
            font-weight: 600;
            color: #fff;
            background-color: #27ae60;
            border: none;
            border-radius: 5px;
            cursor: pointer;
            transition: background-color 0.3s;
            text-align: center;
        }

        .btn-submit:hover {
            background-color: #2ecc71;
        }

        .form-group .error {
            color: #e74c3c;
            font-size: 14px;
            margin-top: 5px;
        }
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

        @media (max-width: 600px) {
            .container {
                padding: 15px;
            }

            .page-header h1 {
                font-size: 28px;
            }

            .form-group input, 
            .form-group textarea {
                font-size: 14px;
            }

            .btn-submit {
                font-size: 16px;
            }
        }
    </style>
</head>
<body>

<div class="container">
	<div class="spinner-container">
			    <div class="spinner"></div>
			</div>
    <div class="page-header">
        <h1>Add Driver</h1>
    </div>

    <form id="addDriverForm">
        <div class="form-group">
            <label for="driverName">Driver Name</label>
            <input type="text" id="driverName" name="driverName" placeholder="Enter driver name" required>
        </div>

        <div class="form-group">
            <label for="driverMobile">Driver Mobile</label>
            <input type="tel" id="driverMobile" name="driverMobile" placeholder="Enter driver mobile number" pattern="[0-9]{10}" required>
            <span class="error" id="mobileError"></span>
        </div>

        <div class="form-group">
            <label for="driverAddress">Driver Address</label>
            <textarea id="driverAddress" name="driverAddress" placeholder="Enter driver address" required></textarea>
        </div>

        <div class="form-group">
            <label for="driverAadhar">Driver Aadhar</label>
            <input type="text" id="driverAadhar" name="driverAadhar" placeholder="Enter driver Aadhar number" pattern="[0-9]{12}" required>
            <span class="error" id="aadharError"></span>
        </div>
		
		<div class="form-group">
		           <label for="driverLiecense">Driver Liecense</label>
		           <input type="text" id="driverLiecense" name="driverLiecense" placeholder="Enter driver Liecense number" required>
		</div>

        <button type="submit" class="btn-submit">Add Driver</button>
        
        
        <div class="success-message" id="successMessage">
            Driver added successfully!
        </div>
        <div class="error-message" id="errorMessage">
            Error adding Driver. Please try again.
        </div>
    </form>
</div>
 	<!-- Include jQuery -->
	<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>

	<!-- Include DataTables CSS -->
	<link rel="stylesheet" href="https://cdn.datatables.net/1.13.5/css/jquery.dataTables.min.css">

	<!-- Include DataTables JavaScript -->
	<script src="https://cdn.datatables.net/1.13.5/js/jquery.dataTables.min.js"></script>
	<jsp:include page="url.jsp" />
<script>
	$('.spinner-container').hide();
    document.getElementById('addDriverForm').addEventListener('submit', function(event) {
		$('.spinner-container').show();
        event.preventDefault();
        
        // Clear previous errors
        document.getElementById('mobileError').textContent = '';
        document.getElementById('aadharError').textContent = '';
        
        let isValid = true;
        
        // Validate Mobile Number
        const mobile = document.getElementById('driverMobile').value;
        if (!/^[0-9]{10}$/.test(mobile)) {
            document.getElementById('mobileError').textContent = 'Invalid mobile number. Must be 10 digits.';
			$('.spinner-container').hide();
            isValid = false;
        }
        
        // Validate Aadhar Number
        const aadhar = document.getElementById('driverAadhar').value;
        if (!/^[0-9]{12}$/.test(aadhar)) {
            document.getElementById('aadharError').textContent = 'Invalid Aadhar number. Must be 12 digits.';
			$('.spinner-container').hide();
            isValid = false;
        }
        
        if (isValid) {
        	const driverName = document.getElementById('driverName').value;
            const driverMobile = document.getElementById('driverMobile').value;
            const driverAddress = document.getElementById('driverAddress').value;
            const driverAadhar = document.getElementById('driverAadhar').value; //driverLiecense
			const driverLiecense = document.getElementById('driverLiecense').value;
            $.ajax({
                url: prod_url+'/api/driver/add',  // URL for adding the vehicle
                type: 'POST',
                contentType: 'application/json',
                data: JSON.stringify({
                	driverName: driverName,
                	driverMobile: driverMobile, 
                	driverAddress: driverAddress,
                	driverAadhar: driverAadhar,
					driverLiecense: driverLiecense
                }),
                success: function(msg) {
                    if (msg === "Driver added successfully!") {
                        // Display success message
                        document.getElementById('successMessage').style.display = 'block';
                        document.getElementById('errorMessage').style.display = 'none';
						$('.spinner-container').hide();
                    } else {
                        // Display error message
                        document.getElementById('successMessage').style.display = 'none';
                        document.getElementById('errorMessage').style.display = 'block';
						$('.spinner-container').hide();
                    }
                },
                error: function(xhr, status, error) {
                    console.error("Error adding order:", error);
                    // Display error message
                    document.getElementById('successMessage').style.display = 'none';
                    document.getElementById('errorMessage').style.display = 'block';
					$('.spinner-container').hide();
                }
            });
        }
    });
</script>

</body>
</html>
