<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Voucher Management</title>
    <!-- DataTables CSS -->
    <link rel="stylesheet" href="https://cdn.datatables.net/1.13.5/css/jquery.dataTables.min.css">
    <script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
    <script src="https://cdn.datatables.net/1.13.5/js/jquery.dataTables.min.js"></script>
    <style>
        /* Modal Centering */
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
		.modal { 
		    display: flex; /* Hidden by default */
		    position: fixed; 
		    top: 0; 
		    left: 0; 
		    width: 100%; 
		    height: 100%; 
		    background-color: rgba(0, 0, 0, 0.5);  /* Flexbox for centering */
		    justify-content: center; /* Horizontal centering */
		    align-items: center; /* Vertical centering */
		    z-index: 1000; 
		}

        .modal-content {
            background: white;
            padding: 20px;
            width: 350px;
            border-radius: 8px;
            box-shadow: 0 4px 15px rgba(0, 0, 0, 0.2);
        }
        .modal-header {
            font-size: 18px;
            margin-bottom: 10px;
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
            border-radius: 4px;
        }
        .button-group {
            text-align: right;
        }
        .button-group button {
            padding: 10px 20px;
            margin-left: 10px;
            border: none;
            border-radius: 5px;
            cursor: pointer;
        }
        .button-group .cancel {
            background-color: #ccc;
        }
        .button-group .submit {
            background-color: #27ae60;
            color: white;
        }
    </style>
</head>
<body>
	<div class="spinner-container">
			    <div class="spinner"></div>
			</div>
    <div style="margin: 20px;">
        <h1>Voucher Management</h1>
        <button id="addVoucherBtn" style="margin-bottom: 20px; padding: 10px 20px; background-color: #007bff; color: white; border: none; border-radius: 5px; cursor: pointer;">
            Add Voucher
        </button>
        <table id="voucherTable" class="display" style="width:100%;">
            <thead>
                <tr>
                    <th>ID</th>
                    <th>Machine Number</th>
                    <th>Driver Name</th>
					<th>Amount</th>
                    <th>Create Date</th>
                    <th>Comment</th>
                    <th>Actions</th>
                </tr>
            </thead>
            <tbody>
                <!-- Data will be dynamically inserted here -->
            </tbody>
        </table>
    </div>

    <!-- Add Voucher Modal -->
    <div id="addVoucherModal" class="modal">
        <div class="modal-content">
            <div class="modal-header">Add Voucher</div>
            <form id="addVoucherForm">
				<div class="form-group">
				    <label for="vehicaleList">Select Vehicale</label>
					<select id="vehicaleList" style="width: 350px; height: 40px; padding: 5px; border-radius: 4px; border: 1px solid #ccc;">
											        <!-- Driver options will be dynamically appended -->
					</select>
				</div>
                <div class="form-group">
					<label for="driverList">Driver Name</label>
					<select id="driverList" style="width: 350px; height: 40px; padding: 5px; border-radius: 4px; border: 1px solid #ccc;">
							        <!-- Driver options will be dynamically appended -->
					</select>
				</div>
				<div class="form-group">
				      <label for="amount">Amount</label>
				      <input type="textnumber" id="amount" name="amount" required>
				</div>
                <div class="form-group">
                    <label for="createDate">Create Date</label>
                    <input type="date" id="createDate" name="createDate" required>
                </div>
                <div class="form-group">
                    <label for="comment">Comment</label>
                    <input type="text" id="comment" name="comment" required>
                </div>
                <div class="button-group">
                    <button type="button" class="cancel" id="cancelBtn">Cancel</button>
                    <button type="submit" class="submit">Add</button>
                </div>
            </form>
        </div>
    </div>
	<jsp:include page="url.jsp" />
    <script>
        $(document).ready(function () {
			$('.spinner-container').show();
			$('#addVoucherModal').hide();
            const voucherTable = $('#voucherTable').DataTable({
				columns:[
				         { title: "ID" },
				         { title: "Machine Number" },
				         { title: "Driver Name" },
						 { title: "Amount" },
						 { title: "Create Date" },
						 { title: "Comment" },
						 { title: "Actions" }
				             
				      ],
					order: [[0, 'desc']]
			});

            // Fetch and populate vouchers
            function fetchVouchers() {
                $.ajax({
                    url: prod_url+'/api/voucher/getAll',
                    method: 'GET',
                    success: function (data) {
                        voucherTable.clear();
                        data.forEach(voucher => {
                            voucherTable.row.add([
                                voucher.id,
                                voucher.machineNumber,
                                voucher.driverName,
								voucher.amount,
                                voucher.createDate,
                                voucher.comment,
								`<button class="deleteBtn" data-id="${voucher.id}" style="padding: 5px 10px; background-color: #ff4d4d; color: white; border: none; border-radius: 4px; cursor: pointer;">
								                        Delete
								                    </button>`
                            ]).draw();
                        });
						$('.spinner-container').hide();
						$('#voucherTable tbody').on('click', 'tr', function () {
									    //const id = $(this).data('id'); // Retrieve the voucher ID
										const data = voucherTable.row(this).data();
										const vId = data[0];
										console.log(' '+vId);
									    if (confirm('Are you sure you want to delete this voucher?')) {
									        $.ajax({
									            url: prod_url+'/api/voucher/delete/?id='+vId,
									            method: 'GET',
									            success: function () {
									                alert('Voucher deleted successfully!');
									                fetchVouchers(); // Refresh the table after deletion
									            },
									            error: function () {
									                alert('Error deleting voucher.');
									            }
									        });
									    }
									});
                    },
                    error: function () {
                        alert('Error fetching voucher data.');
                    }
                });
            }
            fetchVouchers();

            // Show Add Voucher Modal
            $('#addVoucherBtn').click(function () {
                $('#addVoucherModal').fadeIn();
            });

            // Hide Add Voucher Modal
            $('#cancelBtn').click(function () {
                $('#addVoucherModal').fadeOut();
            });

            // Add Voucher Form Submission
            $('#addVoucherForm').submit(function (e) {
                e.preventDefault();
                const newVoucher = {
                    machineNumber: document.getElementById('vehicaleList').options[document.getElementById('vehicaleList').selectedIndex].text,
                    driverName: document.getElementById('driverList').options[document.getElementById('driverList').selectedIndex].text,
					amount: $('#amount').val(),
					createDate: $('#createDate').val(),
                    comment: $('#comment').val()
                };
                $.ajax({
                    url: prod_url+'/api/voucher/add',
                    method: 'POST',
                    contentType: 'application/json',
                    data: JSON.stringify(newVoucher),
                    success: function () {
                        alert('Voucher added successfully!');
                        $('#addVoucherModal').fadeOut();
                        $('#addVoucherForm')[0].reset();
                        fetchVouchers();
                    },
                    error: function () {
                        alert('Error adding voucher.');
                    }
                });
            });
			$.ajax({
					        url: prod_url+'/api/vehicles/getAll',
					        type: 'GET',
					        success: function(vehicles) {
					            const vehicleList = $('#vehicaleList');
					            vehicleList.empty();
					            vehicleList.append('<option value=""></option>');

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

						$.ajax({
							        url: prod_url+'/api/driver/getAll', // Adjust this URL to match your API endpoint
							        type: 'GET',
							        success: function(drivers) {
							            const driverList = $('#driverList'); // Target the select element
							            driverList.empty(); // Clear any previous options
							            driverList.append('<option value=""></option>'); // Placeholder option

							            drivers.forEach(function(driver) {
							                const option = $('<option></option>').val(driver.id).text(driver.driverName);
							                driverList.append(option); // Append the option to the select element
							            });
							        },
							        error: function(xhr, status, error) {
							            console.error("Error fetching driver data:", error);
							        }
							    });
						
            // Delete Voucher
			

        });
    </script>
</body>
</html>
