<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Submit Location</title>

    <!-- Bootstrap CSS -->
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css">
    
    <!-- jQuery & DataTables -->
    <script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
    <script src="https://cdn.datatables.net/1.11.5/js/jquery.dataTables.min.js"></script>
    <link rel="stylesheet" href="https://cdn.datatables.net/1.11.5/css/jquery.dataTables.min.css">
	<jsp:include page="url.jsp" />
    <script>
		function hideForm() {
		    document.getElementById("locationF").style.display = "none";
		}
			    function showForm() {
			        document.getElementById("locationF").style.display = "block";
			    }

        $(document).ready(function() {
            let table = $('#locationTable').DataTable({
                columns: [
                    { title: "ID" },
                    { title: "Site Name" },
                    { title: "Address" },
                    { title: "Facilities" },
                    { title: "Map Link" },
                    { title: "Image" },
                    { title: "Actions" }
                ],
                order: [[0, 'desc']]
            });

            // Function to load locations from API
            function loadLocations() {
                $.ajax({
                    url: prod_url+"/api/location/all",
                    type: "GET",
                    success: function(data) {
                        table.clear(); // Clear existing table data
                        data.forEach(function(location) {
                            $.get(prod_url+"/api/location/image/" + location.id, function(imageData) {
                                let imgSrc = "data:image/jpeg;base64," + imageData.image;
								let row = [
								    location.id,
								    location.siteName,
								    location.address,
								    location.facilities,
								    '<a href="' + location.mapLink + '" target="_blank">View Map</a>',
								    '<img src="' + imgSrc + '" width="100">',
								    '<button class="btn btn-danger btn-sm" onclick="deleteLocation(' + location.id + ')">Delete</button>'
								];

                                table.row.add(row).draw();
                            });
                        });
                    },
                    error: function(xhr) {
                        alert("Error loading locations: " + xhr.responseText);
                    }
                });
            }

            // Load locations on page load
            loadLocations();

            // Form submission for saving location
            $("#locationForm").submit(function(event) {
                event.preventDefault();

                let formData = new FormData();
                formData.append("locationImg", $("#locationImg")[0].files[0]);
                formData.append("siteName", $("#siteName").val());
                formData.append("address", $("#address").val());
                formData.append("facilities", $("#facilities").val());
                formData.append("mapLink", $("#mapLink").val());

                $.ajax({
                    url: prod_url+"/api/location/save",
                    type: "POST",
                    data: formData,
                    processData: false,
                    contentType: false,
                    success: function(response) {
                        alert("Location submitted successfully!");
                        $("#locationForm")[0].reset();
                        loadLocations(); // Reload data
                    },
                    error: function(xhr) {
                        alert("Error submitting location: " + xhr.responseText);
                    }
                });
            });

            // Function to delete a location
            window.deleteLocation = function(id) {
				console.log(id);
                if (confirm("Are you sure you want to delete this location?")) {
                    $.ajax({
                        url: prod_url+"/api/location/delete/" + id,
                        type: "DELETE",
                        success: function(response) {
                            alert("Location deleted successfully!");
                            loadLocations();
                        },
                        error: function(xhr) {
                            alert("Error deleting location: " + xhr.responseText);
                        }
                    });
                }
            };
        });
    </script>
</head>
<body>

<div class="container mt-4">
	<input type="submit" class="btn btn-success" value="Add location" onclick="showForm()"/>

	<div id="locationF" style="display: none;">
	    <h2 class="text-center">Submit Location</h2>
	    
	    <form id="locationForm" enctype="multipart/form-data">
	        <div class="mb-3">
	            <label for="locationImg" class="form-label">Location Image</label>
	            <input type="file" id="locationImg" name="locationImg" class="form-control" required>
	        </div>

	        <div class="mb-3">
	            <label for="siteName" class="form-label">Site Name</label>
	            <input type="text" id="siteName" name="siteName" class="form-control" required>
	        </div>

	        <div class="mb-3">
	            <label for="address" class="form-label">Address</label>
	            <textarea id="address" name="address" class="form-control" rows="3" required></textarea>
	        </div>

	        <div class="mb-3">
	            <label for="facilities" class="form-label">Facilities</label>
	            <textarea id="facilities" name="facilities" class="form-control" rows="3" required></textarea>
	        </div>

	        <div class="mb-3">
	            <label for="mapLink" class="form-label">Google Map Link</label>
	            <input type="text" id="mapLink" name="mapLink" class="form-control" required>
	        </div>

	        <button type="submit" class="btn btn-success">Submit Location</button>
			<button type="button" class="btn btn-success" onclick="hideForm()">Close</button>
	    </form>
	</div>

	

    <h3 class="mt-4">Stored Locations</h3>
    <table id="locationTable" class="table table-bordered">
        <thead>
            <tr>
                <th>ID</th>
                <th>Site Name</th>
                <th>Address</th>
                <th>Facilities</th>
                <th>Map Link</th>
                <th>Image</th>
                <th>Actions</th>
            </tr>
        </thead>
        <tbody></tbody>
    </table>
</div>

</body>
</html>
