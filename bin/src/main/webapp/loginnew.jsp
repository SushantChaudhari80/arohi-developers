<%@ page contentType="text/html;charset=UTF-8" language="java" %>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Login - Transport Management System</title>
    <style>
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

        
        body {
            background-color: #f4f4f4;
            display: flex;
            justify-content: center;
            align-items: center;
            height: 100vh;
            margin: 0;
            font-family: Arial, sans-serif;
        }

        .container {
            background: white;
            padding: 20px;
            border-radius: 5px;
            box-shadow: 0 0 10px rgba(0, 0, 0, 0.1);
            width: 300px; /* Fixed width for the form */
            text-align: center; /* Center text inside the container */
        }

        h2 {
            margin-bottom: 20px;
			color: white;
        }

        input[type="text"],
        input[type="password"] {
            width: 100%;
            padding: 10px;
            margin: 10px 0;
            border: 1px solid #ccc;
            border-radius: 5px;
        }

        input[type="submit"] {
            background-color: #5cb85c;
            color: white;
            border: none;
            padding: 10px;
            border-radius: 5px;
            cursor: pointer;
        }

        input[type="submit"]:hover {
            background-color: #4cae4c;
        }
    </style>
	<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
	<jsp:include page="url.jsp" />
	<script>
		window.onload = function() {
		           history.pushState(null, null, window.location.href);
		           window.onpopstate = function() {
		               history.pushState(null, null, window.location.href);
		           };
		       };
	$(document).ready(function() {
		$('.spinner-container').hide();
	});
	    function loginMeth(event){
	    	$('.spinner-container').show();
	        event.preventDefault(); // Prevent form submission

	        var email = document.getElementsByName('email')[0].value;
	        var pass  = document.getElementsByName('password')[0].value;

	        $.ajax({
	            url: prod_url+'/login/user?email='+email+'&pass='+pass,
	            type: 'GET',
	            dataType: 'json',
	            success: function(response) {
	            	$('.spinner-container').hide();
	                if(response.message === "success"){
						window.location.href = 'dashboard.jsp'; 
						}else{
							alert(response.message);
							}
					
	            },
	            error: function(xhr, status, error) {
	                $('#result').html('Error: ' + error);
	            }
	        });
	    }
	</script>
	</head>
	<body style="background-image: url('img/bk4.jpg'); background-position: center;">
		<div class="spinner-container">
		    <div class="spinner"></div>
		</div>

	    <div class="container" style="background-image: url('img/bk4.jpg'); background-position: center;">
	        <h2>Login</h2>

	        <form style="background-image: url('img/bk4.jpg'); background-position: center;" action="" method="post" onsubmit="loginMeth(event)">
	            <input type="text" name="email" placeholder="Username" required>
	            <input type="password" name="password" placeholder="Password" required>
	            <button type="submit">Login</button>
	        </form>
	        <div id="result"></div>
	    </div>
	</body>
	</html>
