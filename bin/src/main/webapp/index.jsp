<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Transport Services</title>
    <link rel="stylesheet" href="styles.css">
</head>
<body>
    <header>
        <h1>Transport Services</h1>
        <nav>
            <ul>
                <li><a href="#home">Home</a></li>
                <li><a href="#about">About Us</a></li>
                <li><a href="#contact">Contact</a></li>
				<li><a href="loginnew.jsp">Login</a></li>
            </ul>
        </nav>
    </header>
    
    <main>
        <section id="home">
            <h2>Welcome to Our Transport Company</h2>
            <p>Your reliable partner in transportation solutions.</p>
        </section>
		
				<section id="about">
			            <h2>Services</h2>
			            <p>Management Software</p>
						<p>Technical Support</p>
						<p>24/7 Server side Support</p>
			    </section>
    </main>
    
	<script>
		let lastScrollPosition=0;	
		window.addEventListener('scroll',function(){
			let CurrentScrollPosition = window.pageYOffset;
			
			if(CurrentScrollPosition > lastScrollPosition){
				console.log("Scrolling down");
			}
			else{
				console.log("Scrolling up")
			}
			lastScrollPosition = CurrentScrollPosition;	
		});	
	</script>
</body>
</html>
