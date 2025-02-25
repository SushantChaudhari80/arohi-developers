<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Customer List</title>

    <!-- Bootstrap CSS -->
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css">

    <!-- DataTables CSS -->
    <link rel="stylesheet" href="https://cdn.datatables.net/1.11.5/css/jquery.dataTables.min.css">

    <!-- jQuery & DataTables JS -->
    <script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
    <script src="https://cdn.datatables.net/1.11.5/js/jquery.dataTables.min.js"></script>
	<jsp:include page="url.jsp" />
    <script>
        $(document).ready(function() {
            const table = $('#customerTable').DataTable({
                ajax: {
                    url: prod_url+"/api/arohi/customer/all",
                    type: "GET",
                    dataSrc: ""
                },
                columns: [
                    { title: "ID", data: "id" },
                    { title: "Customer Name", data: "name" },
                    { title: "Email", data: "email" },
                    { title: "Phone", data: "phone" },
                    { title: "Plot Number", data: "plotNumber" },
                    { title: "Status", data: "status" },
                    { 
                        title: "Actions",
                        data: null,
                        render: function(data, type, row) {
							return '<button class="btn btn-warning btn-sm edit-btn" data-id="' + row.id + '">Edit</button>' +
							       '<button class="btn btn-danger btn-sm delete-btn" data-id="' + row.id + '">Delete</button>';

                        }
                    }
                ],
                order: [[0, 'desc']]
            });

            // Handle Delete
            $('#customerTable tbody').on('click', '.delete-btn', function() {
                let customerId = $(this).data('id');
                if (confirm("Are you sure you want to delete this customer?")) {
                    $.ajax({
                        url: prod_url+"/api/arohi/customer/delete/" + customerId,
                        type: "DELETE",
                        success: function(response) {
                            alert("Customer deleted successfully!");
                            table.ajax.reload();
                        },
                        error: function(xhr) {
                            alert("Error deleting customer: " + xhr.responseText);
                        }
                    });
                }
            });

            // Handle Edit (redirect to an edit page)
            $('#customerTable tbody').on('click', '.edit-btn', function() {
                let customerId = $(this).data('id');
                window.location.href = "editCustomer.jsp?id=" + customerId;
            });
        });
    </script>
</head>
<body>

<div class="container mt-4">
    <h2 class="text-center">Customer List</h2>
    <table id="customerTable" class="table table-striped table-bordered" style="width:100%">
    </table>
</div>

</body>
</html>
