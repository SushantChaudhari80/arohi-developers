<%@ page contentType="text/html; charset=UTF-8" language="java" %>
<html>
<head>
    <title>Project List</title>
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css">
    <script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
</head>
<body>
    <div class="container">
        <h2 class="text-center mt-3">All Projects</h2>
        <table class="table table-bordered">
            <thead>
                <tr>
                    <th>Image</th>
                    <th>Type</th>
                    <th>Description</th>
                    <th>Actions</th>
                </tr>
            </thead>
            <tbody id="projectTable"></tbody>
        </table>
    </div>
	<jsp:include page="url.jsp" />
    <script>
        $(document).ready(function () {
            $.ajax({
                url: prod_url+"/api/projects/all",
                type: "GET",
                success: function (projects) {
                    let tableContent = "";
                    projects.forEach(function (project) {
                        let imgSrc = project.image 
                            ? "data:image/jpeg;base64," + project.image 
                            : "placeholder.jpg";
                            
                        tableContent += "<tr>" +
                            "<td><img src='" + imgSrc + "' width='100'></td>" +
                            "<td>" + project.type + "</td>" +
                            "<td>" + project.description + "</td>" +
                            "<td><button class='btn btn-danger btn-sm' onclick='deleteProject(" + project.id + ")'>Delete</button></td>" +
                            "</tr>";
                    });
                    $("#projectTable").html(tableContent);
                },
                error: function () {
                    alert("Error fetching projects.");
                }
            });
        });

        // Function to Delete a Project
        function deleteProject(projectId) {
            if (confirm("Are you sure you want to delete this project?")) {
                $.ajax({
                    url: prod_url+"/api/projects/delete/" + projectId,
                    type: "DELETE",
                    success: function () {
                        alert("Project deleted successfully!");
                        location.reload(); // Reload the page to update the table
                    },
                    error: function () {
                        alert("Error deleting project.");
                    }
                });
            }
        }
    </script>
</body>
</html>
