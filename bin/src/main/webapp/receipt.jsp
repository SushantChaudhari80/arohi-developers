<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Receipt Page</title>
    <style>
        body {
            font-family: 'Mangal', Arial, sans-serif;
            margin: 0;
            padding: 0;
            background-color: #f8f8f8;
            display: flex;
            justify-content: center;
            align-items: center;
            height: 100vh;
        }

        .receipt {
            width: 300px;
            background-color: #fff;
            padding: 20px;
            border: 1px solid #ccc;
            border-radius: 5px;
            box-shadow: 0 4px 8px rgba(0, 0, 0, 0.1);
        }

        .header {
            text-align: center;
            margin-bottom: 15px;
        }

        .header h1 {
            font-size: 18px;
            margin: 0;
        }

        .header p {
            margin: 5px 0;
            font-size: 12px;
        }

        .divider {
            border-bottom: 1px dashed #000;
            margin: 10px 0;
        }

        .details {
            font-size: 14px;
        }

        .details div {
            margin-bottom: 8px;
        }

        .footer {
            display: flex;
            justify-content: space-between;
            font-size: 12px;
            margin-top: 20px;
        }

        .footer div {
            border-top: 1px solid #000;
            text-align: center;
            padding-top: 5px;
        }
    </style>
</head>
<body>
    <div class="receipt">
        <div class="header">
            <div>
				<img src="img/logo.png" alt="Logo" style="max-width: 70%; height: auto;"/>
			</div>
            <p id="o_name">Loading</p>
            <p id="address"></p>
            <p>वाळू, विट, खडी, सिमेंट, स्टील, मुरूम, ब्रास</p>
            <p>व सर्व बिल्डिंग मटेरियल</p>
        </div>
        <div class="divider"></div>
        <div class="details">
            <div>बिल नंबर: <span>2102</span></div>
            <div>दिनांक: <span>____________</span></div>
            <div>Customer Name : <span id="summary-customer-name">____________</span></div>
            <div>Owner Name: <span id="">____________</span></div>
            <div>Vehicle Number: <span id="summary-vehicle-number">____________</span></div>
            <div>Material : <span id="summary-soil-brass">____________</span></div>
			<dic>Rate : <span id="summary-soil-rate"></span></div>
        </div>
        <div class="footer">
            <div>Recipiant sign</div>
            <div id=""></div>
        </div>
    </div>
</body>
</html>
