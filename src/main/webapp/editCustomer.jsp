<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Edit Customer</title>

    <!-- Bootstrap CSS -->
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css">

    <!-- jQuery -->
    <script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
	<jsp:include page="url.jsp" />
    <script>
        $(document).ready(function() {
            let urlParams = new URLSearchParams(window.location.search);
            let customerId = urlParams.get('id');
           console.log(customerId);
            // Fetch customer details
            $.ajax({
                url: prod_url+"/api/arohi/customer/" + customerId,
                type: "GET",
                success: function(customer) {
                    $("#id").val(customer.id);
                    $("#name").val(customer.name);
                    $("#email").val(customer.email);
                    $("#phone").val(customer.phone);
                    $("#plotNumber").val(customer.plotNumber);
                    $("#status").val(customer.status);
                },
                error: function(xhr) {
                    alert("Error fetching customer details: " + xhr.responseText);
                }
            });

            // Handle form submission for update
            $("#editCustomerForm").submit(function(event) {
                event.preventDefault();
                let updatedCustomer = {
                    id: $("#id").val(),
                    name: $("#name").val(),
                    email: $("#email").val(),
                    phone: $("#phone").val(),
                    plotNumber: $("#plotNumber").val(),
                    status: $("#status").val()
                };

                $.ajax({
                    url: prod_url+"/api/arohi/customer/update",
                    type: "PUT",
                    contentType: "application/json",
                    data: JSON.stringify(updatedCustomer),
                    success: function(response) {
                        alert("Customer updated successfully!");
                        window.location.href = "customer.jsp"; // Redirect to customer list
                    },
                    error: function(xhr) {
                        alert("Error updating customer: " + xhr.responseText);
                    }
                });
            });
        });
    </script>
</head>
<body>

<div class="container mt-4">
    <h2 class="text-center">Edit Customer</h2>
    <form id="editCustomerForm">
        <input type="hidden" id="id" name="id">

        <div class="mb-3">
            <label for="name" class="form-label">Customer Name</label>
            <input type="text" id="name" name="name" class="form-control" required>
        </div>

        <div class="mb-3">
            <label for="email" class="form-label">Email</label>
            <input type="email" id="email" name="email" class="form-control" required>
        </div>

        <div class="mb-3">
            <label for="phone" class="form-label">Phone</label>
            <input type="text" id="phone" name="phone" class="form-control" required>
        </div>

        <div class="mb-3">
            <label for="plotNumber" class="form-label">Plot Number</label>
            <input type="text" id="plotNumber" name="plotNumber" class="form-control" required>
        </div>

        <div class="mb-3">
            <label for="status" class="form-label">Status</label>
            <select id="status" name="status" class="form-control">
                <option value="Available">Available</option>
                <option value="Booked">Booked</option>
                <option value="Sold">Sold</option>
            </select>
        </div>

        <button type="submit" class="btn btn-primary">Update Customer</button>
    </form>
</div>

</body>
</html>
