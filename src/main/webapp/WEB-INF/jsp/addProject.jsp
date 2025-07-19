<%@ page contentType="text/html; charset=UTF-8" language="java" %>
<html>
<head>
    <title>Add Project</title>
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css">
</head>
<body>
    <div class="container">
        <h2 class="text-center mt-3">Add New Project</h2>
        <form id="projectForm" enctype="multipart/form-data">
            <div class="mb-3">
                <label for="projectType" class="form-label">Project Type</label>
                <select id="projectType" name="type" class="form-control" required>
                    <option value="Mall">Mall</option>
                    <option value="Residential">Residential</option>
                    <option value="Corporate Tower">Corporate Tower</option>
                    <option value="Luxury Apartment">Luxury Apartment</option>
                </select>
            </div>

            <div class="mb-3">
                <label for="description" class="form-label">Description</label>
                <textarea id="description" name="description" class="form-control" rows="3" required></textarea>
            </div>

            <div class="mb-3">
                <label for="projectImage" class="form-label">Upload Image</label>
                <input type="file" id="projectImage" name="image" class="form-control" required>
            </div>

            <button type="submit" class="btn btn-success">Submit</button>
        </form>
    </div>

    <script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
	<jsp:include page="url.jsp" />
    <script>
        $(document).ready(function () {
            $("#projectForm").submit(function (event) {
                event.preventDefault();
                let formData = new FormData(this);

                $.ajax({
                    url: prod_url+"/api/projects/add",
                    type: "POST",
                    data: formData,
                    processData: false,
                    contentType: false,
                    success: function (response) {
                        alert(response);
                        window.location.href = "listProjects.jsp";
                    },
                    error: function (xhr) {
                        alert("Error adding project: " + xhr.responseText);
                    }
                });
            });
        });
    </script>
</body>
</html>
