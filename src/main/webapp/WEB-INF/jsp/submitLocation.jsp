<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Manage Locations</title>
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css">
    <script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
    <script src="https://cdn.datatables.net/1.11.5/js/jquery.dataTables.min.js"></script>
    <link rel="stylesheet" href="https://cdn.datatables.net/1.11.5/css/jquery.dataTables.min.css">
	<jsp:include page="url.jsp" />
    
    <script>
        let editingId = null;
        
        function hideForm() {
            document.getElementById("locationF").style.display = "none";
        }

        function showForm() {
            document.getElementById("locationF").style.display = "block";
            document.getElementById("locationForm").reset();
            editingId = null;
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

            function loadLocations() {
                $.ajax({
                    url: prod_url+"/api/location/all",
                    type: "GET",
                    success: function(data) {
                        table.clear();
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
                                    '<button class="btn btn-primary btn-sm" onclick="editLocation(' + location.id + ')">Edit</button> ' +
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

            loadLocations();

            $("#locationForm").submit(function(event) {
                event.preventDefault();
                let formData = new FormData();
                formData.append("locationImg", $("#locationImg")[0].files[0]);
                formData.append("siteName", $("#siteName").val());
                formData.append("address", $("#address").val());
               
				// Collect selected amenities and append to formData
				let selectedAmenities = [];
				$("input[name='amenities[]']:checked").each(function() {
				    selectedAmenities.push($(this).val());
				});

				// Include other amenities from the textarea
				let otherAmenities = $("#facilities").val();

				// Combine all amenities into a single string (comma-separated)
				let allAmenities = selectedAmenities.join(", ") + (otherAmenities ? ", " + otherAmenities : "");

				formData.append("facilities", allAmenities);
				
                formData.append("mapLink", $("#mapLink").val());
				formData.append("highlights", $("#highlights").val());
				
                let url = editingId ? prod_url+"/api/location/update/" + editingId : prod_url+"/api/location/save";
                let type = editingId ? "PUT" : "POST";

                $.ajax({
                    url: url,
                    type: type,
                    data: formData,
                    processData: false,
                    contentType: false,
                    success: function(response) {
                        alert("Location saved successfully!");
                        $("#locationForm")[0].reset();
                        hideForm();
                        loadLocations();
                    },
                    error: function(xhr) {
                        alert("Error saving location: " + xhr.responseText);
                    }
                });
            });

			window.editLocation = function (id) {
				console.log(id);
			       $.ajax({
			           url: prod_url + "/api/location/" + id,
			           type: "GET",
			           success: function (location) {
			               $("#locationId").val(location.id); // Hidden field to store ID
			               $("#siteName").val(location.siteName);
			               $("#address").val(location.address);
			               $("#facilities").val(location.facilities);
			               $("#mapLink").val(location.mapLink);

			               $("#locationF").show();
			               $("#submitBtn").text("Update Location"); // Change button text
			           },
			           error: function (xhr) {
			               alert("Error fetching location: " + xhr.responseText);
			           }
			       });
			   };

            window.deleteLocation = function(id) {
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
        <h2 class="text-center">Manage Location</h2>
        <form id="locationForm" enctype="multipart/form-data">
            <div class="mb-3">
                <label class="form-label">Location Image</label>
                <input type="file" id="locationImg" name="locationImg" class="form-control">
            </div>
            <div class="mb-3">
                <label class="form-label">Site Name</label>
                <input type="text" id="siteName" name="siteName" class="form-control" required>
            </div>
            <div class="mb-3">
                <label class="form-label">Address</label>
                <textarea id="address" name="address" class="form-control" rows="3" required></textarea>
            </div>
          <!--  <div class="mb-3">
                <label class="form-label">Amenities</label>
                <textarea id="facilities" name="facilities" class="form-control" rows="3" required></textarea>
            </div>-->
			
			<div class="mb-3">
			    <label class="form-label">Amenities</label>

			    <!-- Checkboxes for specific amenities -->
			    <div class="form-check">
			        <input class="form-check-input" type="checkbox" id="wallCompound" name="amenities[]" value="Wall compound to entire project">
			        <label class="form-check-label" for="wallCompound">Wall compound to entire project</label>
			    </div>

			    <div class="form-check">
			        <input class="form-check-input" type="checkbox" id="mainGate" name="amenities[]" value="Main entrance gate">
			        <label class="form-check-label" for="mainGate">Main entrance gate</label>
			    </div>

			    <div class="form-check">
			        <input class="form-check-input" type="checkbox" id="waterSupply" name="amenities[]" value="Proper Water supply">
			        <label class="form-check-label" for="waterSupply">Proper Water supply</label>
			    </div>

			    <div class="form-check">
			        <input class="form-check-input" type="checkbox" id="security" name="amenities[]" value="24 Hr security">
			        <label class="form-check-label" for="security">24 Hr security</label>
			    </div>

			    <div class="form-check">
			        <input class="form-check-input" type="checkbox" id="individualFencing" name="amenities[]" value="Individual fencing to every plot">
			        <label class="form-check-label" for="individualFencing">Individual fencing to every plot</label>
			    </div>

			    <div class="form-check">
			        <input class="form-check-input" type="checkbox" id="treePlantation" name="amenities[]" value="Tree plantation to every plot">
			        <label class="form-check-label" for="treePlantation">Tree plantation to every plot</label>
			    </div>

			    <div class="form-check">
			        <input class="form-check-input" type="checkbox" id="tarRoad" name="amenities[]" value="Internal 20ft tar road">
			        <label class="form-check-label" for="tarRoad">Internal 20ft tar road</label>
			    </div>

			    <div class="form-check">
			        <input class="form-check-input" type="checkbox" id="electricity" name="amenities[]" value="Proper electricity supply">
			        <label class="form-check-label" for="electricity">Proper electricity supply</label>
			    </div>

			    <div class="form-check">
			        <input class="form-check-input" type="checkbox" id="nameBoard" name="amenities[]" value="Individual name board">
			        <label class="form-check-label" for="nameBoard">Individual name board</label>
			    </div>

			    <div class="form-check">
			        <input class="form-check-input" type="checkbox" id="propertySecurity" name="amenities[]" value="Arrangement of property security">
			        <label class="form-check-label" for="propertySecurity">Arrangement of property security</label>
			    </div>

			    <!-- Textarea for additional amenities -->
			    <textarea id="facilities" name="facilities" class="form-control mt-2" rows="3" placeholder="Other amenities..." required></textarea>
			</div>

			<div class="mb-3">
			     <label class="form-label">Location Highlights</label>
			     <textarea id="highlights" name="highlights" class="form-control" rows="3" required></textarea>
			</div>
            <div class="mb-3">
                <label class="form-label">Google Map Link</label>
                <input type="text" id="mapLink" name="mapLink" class="form-control" required>
            </div>
            <button type="submit" class="btn btn-success">Save Location</button>
            <button type="button" class="btn btn-danger" onclick="hideForm()">Close</button>
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