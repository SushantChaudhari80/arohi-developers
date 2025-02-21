<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Add Customer</title>
    <script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
    <style>
        body {
            font-family: Arial, sans-serif;
            background-color: #f4f4f4;
            text-align: center;
        }
        .container {
            width: 50%;
            margin: auto;
            background: white;
            padding: 20px;
            box-shadow: 0px 0px 10px gray;
            border-radius: 10px;
        }
        input, select {
            width: 100%;
            padding: 10px;
            margin: 10px 0;
            border: 1px solid #ccc;
            border-radius: 5px;
        }
        button {
            background-color: #28a745;
            color: white;
            padding: 10px;
            border: none;
            border-radius: 5px;
            cursor: pointer;
        }
        button:hover {
            background-color: #218838;
        }
    </style>
    <script>
        $(document).ready(function() {
            $("#customerForm").submit(function(event) {
                event.preventDefault();
                var customerData = {
                    name: $("#name").val(),
                    email: $("#email").val(),
                    phone: $("#phone").val(),
                    plotNumber: $("#plotNumber").val(),
                    status: $("#status").val()
                };
                
                $.ajax({
                    url: "/api/arohi/customer/add",
                    type: "POST",
                    contentType: "application/json",
                    data: JSON.stringify(customerData),
                    success: function(response) {
                        alert("Customer added successfully!");
                        $("#customerForm")[0].reset();
                    },
                    error: function(xhr, status, error) {
                        alert("Error adding customer: " + xhr.responseText);
                    }
                });
            });
        });
    </script>
</head>
<body>
    <div class="container">
        <h2>Add Customer</h2>
        <form id="customerForm">
            <label for="name">Customer Name:</label>
            <input type="text" id="name" name="name" required>

            <label for="email">Email:</label>
            <input type="email" id="email" name="email" required>

            <label for="phone">Phone Number:</label>
            <input type="text" id="phone" name="phone" required>

            <label for="plotNumber">Plot Number:</label>
            <input type="text" id="plotNumber" name="plotNumber" required>

            <label for="status">Status:</label>
            <select id="status" name="status">
                <option value="Available">Available</option>
                <option value="Booked">Booked</option>
                <option value="Sold">Sold</option>
            </select>

            <button type="submit">Add Customer</button>
        </form>
    </div>
</body>
</html>
