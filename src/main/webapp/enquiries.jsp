<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Enquiries List</title>
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css">
    <script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
</head>
<body>
    <div class="container mt-5">
        <h2 class="text-center">All Enquiries</h2>
        <table class="table table-bordered mt-3">
            <thead class="table-dark">
                <tr>
                    <th>ID</th>
					<th>Date</th>
                    <th>Name</th>
					<th>Email</th>
                    <th>Mobile</th>
                    <th>Message</th>
                    <th>WhatsApp</th>
                </tr>
            </thead>
            <tbody id="enquiryTableBody">
                <!-- Data will be loaded here dynamically -->
            </tbody>
        </table>
    </div>
	<jsp:include page="url.jsp" />
    <script>
        $(document).ready(function () {
            // Function to load enquiries
            function loadEnquiries() {
                $.ajax({
                    type: "GET",
                    url: prod_url+"/api/enquiries/all",
                    dataType: "json",
                    success: function (data) {
                        var tableBody = $("#enquiryTableBody");
                        tableBody.empty(); // Clear table before adding new data

                        if (data.length === 0) {
                            tableBody.append("<tr><td colspan='7' class='text-center'>No enquiries found</td></tr>");
                        } else {
                            $.each(data, function (index, enquiry) {
                                var whatsappMessage = encodeURIComponent("Greetings from Arohi Developers, thank you for your enquiry.");
                                var whatsappLink = "https://wa.me/" + enquiry.mobile + "?text=" + whatsappMessage;

                                tableBody.append(
                                    "<tr>" +
                                    "<td>" + enquiry.id + "</td>" +
									"<td>" + enquiry.e_date + "</td>" +
                                    "<td>" + enquiry.name + "</td>" +
                                    "<td>" + enquiry.email + "</td>" +
                                    "<td>" + enquiry.mobile + "</td>" +
                                    "<td>" + enquiry.message + "</td>" +
                                    "<td><a href='" + whatsappLink + "' target='_blank' class='btn btn-success btn-sm'>WhatsApp</a></td>" +
                                    "</tr>"
                                );
                            });
                        }
                    },
                    error: function (xhr, status, error) {
                        alert("Error loading enquiries: " + xhr.responseText);
                    }
                });
            }

            // Load enquiries on page load
            loadEnquiries();
        });
    </script>
</body>
</html>
