<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Machine Reading Form</title>
    <link href="https://fonts.googleapis.com/css2?family=Roboto:wght@400;500&display=swap" rel="stylesheet">
    <style>
        body {
            font-family: 'Roboto', sans-serif;
            margin: 0;
            padding: 20px;
            background-color: #f4f7fa;
        }

        .form-container {
            max-width: 500px;
            margin: 0 auto;
            background: #ffffff;
            padding: 20px;
            border-radius: 8px;
            box-shadow: 0 2px 10px rgba(0, 0, 0, 0.1);
        }

        h2 {
            text-align: center;
            color: #4a76a8;
        }

        .form-group {
            margin-bottom: 15px;
        }

        label {
            display: block;
            margin-bottom: 5px;
            font-weight: 500;
            color: #333;
        }

        input[type="text"], input[type="file"] {
            width: 100%;
            padding: 10px;
            border: 1px solid #ddd;
            border-radius: 4px;
            font-size: 14px;
        }

        .checkbox-group {
            display: flex;
            gap: 20px;
        }

        .btn-submit {
            width: 100%;
            padding: 10px;
            background-color: #4a76a8;
            color: #ffffff;
            border: none;
            border-radius: 4px;
            font-size: 16px;
            cursor: pointer;
            transition: background-color 0.3s ease;
        }

        .btn-submit:hover {
            background-color: #3d5a80;
        }
		/* Basic Reset */
		* {
		    margin: 0;
		    padding: 0;
		    box-sizing: border-box;
		}

		body {
		    font-family: 'Roboto', sans-serif;
		    background-color: #f4f7fa;
		    color: #333;
		    padding: 20px;
		}

		/* Centering the container on the page */
		.form-container {
		    max-width: 500px;
		    margin: 50px auto;
		    background-color: #fff;
		    border-radius: 12px;
		    box-shadow: 0 10px 30px rgba(0, 0, 0, 0.1);
		    padding: 30px;
		    text-align: center;
		    transition: all 0.3s ease;
		}

		/* Smooth hover effect on container */
		.form-container:hover {
		    box-shadow: 0 15px 40px rgba(0, 0, 0, 0.2);
		}

		/* Styling for the form header */
		.form-container h2 {
		    margin-bottom: 20px;
		    font-size: 24px;
		    color: #2c3e50;
		    font-weight: 600;
		    letter-spacing: 1px;
		    text-transform: uppercase;
		}

		/* Label Styling */
		.form-container label {
		    display: block;
		    text-align: left;
		    font-size: 14px;
		    color: #555;
		    margin-bottom: 8px;
		    font-weight: 500;
		    letter-spacing: 0.5px;
		}

		/* Select Field Styling */
		.form-container select {
		    width: 100%;
		    padding: 12px;
		    border: 2px solid #ccc;
		    border-radius: 6px;
		    font-size: 14px;
		    background-color: #f9f9f9;
		    color: #555;
		    transition: border-color 0.3s ease;
		    outline: none;
		}

		/* On hover and focus, the input gets a colored border */
		.form-container select:hover,
		.form-container select:focus {
		    border-color: #2980b9;
		}

		/* Button Styling */
		.btn-submit {
		    width: 100%;
		    padding: 12px 20px;
		    background-color: #2980b9;
		    color: white;
		    font-size: 16px;
		    font-weight: 600;
		    border: none;
		    border-radius: 6px;
		    cursor: pointer;
		    margin-top: 20px;
		    transition: background-color 0.3s ease;
		}

		/* Hover effect on submit button */
		.btn-submit:hover {
		    background-color: #1c5980;
		}

		/* Adding responsiveness */
		@media (max-width: 600px) {
		    .form-container {
		        padding: 20px;
		        max-width: 100%;
		        margin: 20px;
		    }

		    .form-container h2 {
		        font-size: 20px;
		    }

		    .btn-submit {
		        font-size: 14px;
		        padding: 10px;
		    }
		}

    </style>
	<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>

			<!-- Include DataTables CSS -->
			<link rel="stylesheet" href="https://cdn.datatables.net/1.13.5/css/jquery.dataTables.min.css">

			<!-- Include DataTables JavaScript -->
			<script src="https://cdn.datatables.net/1.13.5/js/jquery.dataTables.min.js"></script>
			<jsp:include page="url.jsp" />
	<script>
		$(document).ready(function() {
		    $('#from1').hide();
		    
		    // Fetching owners and populating the select dropdown
		    $.ajax({
		        url: prod_url+'/api/customers/getAll', // Adjust this URL to match your API endpoint
		        type: 'GET',
		        success: function(onwers) {
		            const onwerList = $('#onwerList'); // Target the select element
		            onwerList.empty(); // Clear any previous options
		            onwerList.append('<option value="">Select an Owner</option>'); // Placeholder option

		            onwers.forEach(function(onwer) {
		                const option = $('<option></option>').val(onwer.mobile).text(onwer.name);
		                onwerList.append(option); // Append the option to the select element
		            });
		        },
		        error: function(xhr, status, error) {
		            console.error("Error fetching owner data:", error);
		        }
		    });
		});
 
		
		function submitForm(event) {
		    event.preventDefault(); // Prevent default form submission

		    const selectedOwnerMobile = $('#onwerList').val(); // Get the selected value from the dropdown

		    if (selectedOwnerMobile) {
		        console.log("Selected Owner Mobile: " + selectedOwnerMobile);
		        window.location.href = 'readingForm.jsp?ownerMobile=' + selectedOwnerMobile; // Redirect to the new page with query param
		    } else {
		        console.log("No owner selected.");
		        alert("No owner selected.");
		    }
		}

		
				
		
	</script>
</head>
<body>
	<div>
	    <div id="from2" class="form-container">
	        <h2>Select Owner</h2>
	        <form id="machineReadingForm"  onsubmit="submitForm(event)">
	            <label for="onwerList">Owner Name</label>
	            <select id="onwerList">
	                <!-- Options will be dynamically appended here -->
	            </select>
	            
	            <button id="subbtn" type="submit" class="btn-submit">Submit</button>
	        </form>
	    </div>
	</div>
	

</body>
</html>
