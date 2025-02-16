<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Machine Reading Form</title>
    <link href="https://fonts.googleapis.com/css2?family=Roboto:wght@400;500&display=swap" rel="stylesheet">
    <style>
		.form-container {
		    max-width: 500px;
		    margin: 0 auto;
		    padding: 20px;
		    background-color: #f4f7fa;
		    border-radius: 8px;
		    box-shadow: 0 2px 10px rgba(0, 0, 0, 0.1);
		}

		h2 {
		    text-align: center;
		    margin-bottom: 20px;
		    color: #333;
		}

		.form-group {
		    margin-bottom: 15px;
		}

		.form-group label {
		    display: block;
		    margin-bottom: 5px;
		    font-weight: bold;
		}

		.form-group input,
		.form-group select {
		    width: 100%;
		    padding: 10px;
		    border: 1px solid #ccc;
		    border-radius: 4px;
		    font-size: 14px;
		}

		.form-group input:focus,
		.form-group select:focus {
		    border-color: #007bff;
		}

		.btn-submit {
		    width: 100%;
		    padding: 10px;
		    background-color: #28a745;
		    color: white;
		    border: none;
		    border-radius: 4px;
		    cursor: pointer;
		    font-size: 16px;
		}

		.btn-submit:hover {
		    background-color: #218838;
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
	        // Function to get query parameter from URL
			$('#endReading').prop('disabled', true).val('');
	        function getQueryParameter(param) {
	            const urlParams = new URLSearchParams(window.location.search);
	            return urlParams.get(param);
	        }

	        // Retrieve owner mobile number from the URL
	        const selectedOwnerMobile = getQueryParameter('ownerMobile');
	        console.log("Selected Owner Mobile: " + selectedOwnerMobile);

	        // Populate driver list based on selected owner
	        $.ajax({
	            url: prod_url+'/api/driver/getAllByOnwer?ownerMobile=' + selectedOwnerMobile,
	            type: 'GET',
	            success: function (drivers) {
	                const driverList = $('#driverList'); // Target the select element
	                driverList.empty(); // Clear any previous options
	                driverList.append('<option value="">Select a driver</option>'); // Placeholder option

	                drivers.forEach(function (driver) {
	                    const option = $('<option></option>').val(driver.id).text(driver.driverName);
	                    driverList.append(option); // Append the option to the select element
	                });
	            },
	            error: function (xhr, status, error) {
	                console.error("Error fetching driver data:", error);
	            }
	        });

	        // Enable/Disable fields based on reading type selection
	        $('input[name="readingType"]').on('change', function () {
	            if ($(this).val() === 'startReading') {
	                $('#startReading').prop('disabled', false);
	                $('#endReading').prop('disabled', true).val('');  // Clear value when disabled
	            } else {
	                $('#startReading').prop('disabled', true).val('');
	                $('#endReading').prop('disabled', false);
	            }
	        });
			
			//------------------------------------
			$('select[id="driverList"]').on('change', function () {
			        // Get the selected driver ID
			        const drId = $(this).val();
			        console.log(drId);
					
					$.ajax({
					            url: prod_url+'/api/driver/getById?drId=' + drId,
					            type: 'GET',
					            success: function (driver) {
									console.log(driver);
									$('#Mnumber').text(driver.machineNumber || "Driver is not assign to machine");
									$('#Mnumber').show();
					            },
					            error: function (xhr, status, error) {
					                console.error("Error fetching driver data:", error);
					            }
					        });
			    });
			
			//-----------------------------------

	        // Handle form submission
	        $('#vehicleReadingForm').on('submit', function (e) {
	            e.preventDefault(); // Prevent default form submission

	            const selectedReadingType = $('input[name="readingType"]:checked').val();
	           
				const formData = new FormData(this);

				   // Append additional data that is not directly part of the form
				   formData.append('selectedOwnerMobile', selectedOwnerMobile);
				   formData.append('machineNumber', $('#Mnumber').text());
				   //const driverName = $('#driverList option:selected').text();
				    const driverId =  $('#driverList option:selected').text(); // Assuming 'driverList' is the ID of the dropdown
				      if (driverId) {
				          formData.append('driverId', driverId);  // Append driverId to FormData
				      }

				      // Append files only if selected
				      const startReadingFile = $('#startReading')[0].files[0];
				      if (startReadingFile) {
				          formData.append('startReading', startReadingFile);
				      }

				      const endReadingFile = $('#endReading')[0].files[0];
				      if (endReadingFile) {
				          formData.append('endReading', endReadingFile);
				      }

				      const disel = $('#disel')[0].files[0];
				      if (disel) {
				          formData.append('disel', disel);
				      }  

	            // Submit form data via AJAX
	            $.ajax({
	                url: prod_url+'/driver/reading/submit',  // REST endpoint
	                type: 'POST',
					processData: false, // Prevent query string serialization
					contentType: false, // Let browser set Content-Type
	                data: formData,
	                success: function (response) {
	                    alert(response);
	                    $('#vehicleReadingForm')[0].reset();
	                    $('#startReading').prop('disabled', false); // Reset to default state Mnumber
	                    $('#endReading').prop('disabled', true);
						$('#Mnumber').hide();
	                },
	                error: function (xhr, status, error) {
	                    console.error("Error submitting vehicle reading:", error);
	                    alert('Error submitting vehicle reading. Please try again.');
	                }
	            });
	        });
	    });
	</script>
</head>
<body>
	<div class="form-container">
	    <h2>Capture Vehicle Reading</h2>
	    <form id="vehicleReadingForm" enctype="multipart/form-data">
	        <!-- Radio buttons for reading type -->
	        <div class="form-group">
	            <label>
	                <input type="radio" name="readingType" value="startReading" checked />
	                Start Reading
	            </label>
	            <label>
	                <input type="radio" name="readingType" value="endReading" />
	                End Reading
	            </label>
	        </div>

	        <!-- Input for Start Reading -->
	        <div class="form-group">
				<label for="startReading">Start Reading:</label>
				<input type="file" id="startReading" name="startReading" accept="image/*">
				<small style="font-size: 12px; color: #666;">(Accepts images up to 5MB)</small>
	        </div>

	        <!-- Input for End Reading -->
	        <div class="form-group">
	            <label for="endReading">End Reading</label>
				<input type="file" id="endReading" name="endReading" accept="image/*">
                <small style="font-size: 12px; color: #666;">(Accepts images up to 5MB)</small>
	        </div>

	        <!-- Input for Maintenance -->
	        <div class="form-group">
	            <label for="maintenanceNumber">Maintenance</label>
	            <input type="number" id="maintenanceNumber" name="maintenanceNumber" value="0"/>
	        </div>
			
			<div class="form-group">
				<label for="disel">Disel</label>
				<input type="file" id="disel" name="disel" accept="image/*">
				<small style="font-size: 12px; color: #666;">(Accepts images up to 5MB)</small>
			</div>

	        <!-- Dropdown for Driver List -->
			<div class="form-group">
			    <label for="driverList">Driver Name</label>
			    <select id="driverList">
			        <!-- Driver options will be dynamically appended -->
			    </select>
			</div>

			<!-- Span to display machine number -->
			<div class="form-group">
				 <label for="Mnumber">Vehicale Number</label>
			    <span id="Mnumber"></span>
			</div>
			
	        <!-- Submit button -->
	        <button type="submit" class="btn-submit">Submit</button>
	    </form>
	</div>

</body>
</html>
