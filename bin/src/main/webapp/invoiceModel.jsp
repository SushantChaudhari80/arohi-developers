<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Tax Invoice</title>
    <style>
        body {
            font-family: Arial, sans-serif;
            margin: 0;
            padding: 0;
            background-color: #f9f9f9;
        }
        .invoice-container {
            width: 90%;
            margin: 20px auto;
            background: #fff;
            border: 1px solid #000;
            padding: 20px;
            box-shadow: 0 0 10px rgba(0, 0, 0, 0.1);
        }
        .invoice-header {
            text-align: center;
            margin-bottom: 20px;
        }
        .invoice-header h1 {
            margin: 0;
            font-size: 24px;
        }
        .invoice-header p {
            margin: 5px 0;
        }
        h2 {
            text-align: center;
            margin: 20px 0;
            font-size: 18px;
            text-decoration: underline;
        }
        .details-table, .items-table, .summary-table {
            width: 100%;
            border-collapse: collapse;
            margin-bottom: 20px;
        }
        .details-table th, .details-table td, .items-table th, .items-table td, .summary-table th, .summary-table td {
            border: 1px solid #000;
            padding: 8px;
            text-align: left;
        }
        .items-table th {
            background-color: #f0f0f0;
        }
        .section {
            margin-bottom: 20px;
        }
        .bank-details {
            margin-top: 20px;
            border: 1px solid #000;
            padding: 10px;
        }
        .bank-details p {
            margin: 5px 0;
        }
        .footer {
            text-align: center;
            margin-top: 20px;
            font-size: 14px;
        }
    </style>
</head>
<body>
    <div class="invoice-container">
        <div class="invoice-header">
            <h1>BHAIRAVNATH CONSTRUCTION & DEVELOPERS</h1>
            <p>s no 150, Saras Nagar Kanade Mala, A.Nagar Maharashtra, 414001</p>
            <h2>TAX INVOICE</h2>
        </div>

        <div class="section">
            <table class="details-table">
                <tr>
                    <th>Invoice No:</th>
                    <td>DA/BK/ANANDA AMRUTA/01</td>
                    <th>GSTIN:</th>
                    <td>27CPBPB1872M2ZS</td>
                </tr>
                <tr>
                    <th>Invoice Date:</th>
                    <td>31.10.2024</td>
                    <th>Reverse Charge (Yes/No):</th>
                    <td>No</td>
                </tr>
                <tr>
                    <th>Place of Supply of Services:</th>
                    <td>Maharashtra</td>
                    <th>Code:</th>
                    <td>27</td>
                </tr>
            </table>
        </div>

        <div class="section">
            <table class="details-table">
                <tr>
                    <th colspan="2">Details of Receiver/Billed to</th>
                    <th colspan="2">Details of Receiver/Billed to</th>
                </tr>
                <tr>
                    <th>Name:</th>
                    <td>Darakar Ananda Amruta</td>
                    <th>Shipping Address:</th>
                    <td></td>
                </tr>
                <tr>
                    <th>Address:</th>
                    <td>At Post - Mandapgaon Tal- Shrigonda Dist. A.Nagar 414001</td>
                    <th>Date of Supply of Services:</th>
                    <td>01.10.2024 to 30.10.2024</td>
                </tr>
                <tr>
                    <th>GSTIN:</th>
                    <td>27APPDJ1237R1ZL</td>
                    <th>Code:</th>
                    <td>27</td>
                </tr>
            </table>
        </div>

        <div class="section">
            <table class="items-table">
                <thead>
                    <tr>
                        <th>S. No.</th>
                        <th>Description of Service</th>
                        <th>SAC Code</th>
                        <th>UOM</th>
                        <th>QTY</th>
                        <th>Rate</th>
                        <th>Amount</th>
                    </tr>
                </thead>
                <tbody>
                    <tr>
                        <td>1</td>
                        <td>Providing Excavator TATA HITACHI EX-210 on hire basis</td>
                        <td>997313</td>
                        <td>-</td>
                        <td>97.00</td>
                        <td>2000.00</td>
                        <td>194000</td>
                    </tr>
                </tbody>
            </table>
        </div>

        <div class="section">
            <table class="summary-table">
                <tr>
                    <th>Total Invoice Amount in Words:</th>
                    <td colspan="6">Rs. Two Lakh Twenty Eight Thousand Nine Hundred and Twenty Only</td>
                </tr>
                <tr>
                    <th>Less: Discount</th>
                    <td colspan="6">-</td>
                </tr>
                <tr>
                    <th>Net Taxable Value</th>
                    <td colspan="6">194000</td>
                </tr>
                <tr>
                    <th>Add: CGST @ 9%</th>
                    <td colspan="6">17,460</td>
                </tr>
                <tr>
                    <th>Add: SGST @ 9%</th>
                    <td colspan="6">17,460</td>
                </tr>
                <tr>
                    <th>Total Tax Amount</th>
                    <td colspan="6">34,920</td>
                </tr>
                <tr>
                    <th>Total Invoice Value</th>
                    <td colspan="6">228,920</td>
                </tr>
            </table>
        </div>

        <div class="bank-details">
            <p><strong>Bank Name:</strong> Central Bank of India</p>
            <p><strong>Bank A/C:</strong> 539800033</p>
            <p><strong>IFSC:</strong> CBIN0283281</p>
        </div>

        <div class="footer">
            <p>Certified that the particulars given above are true and correct</p>
            <p>For M/s. Bhairavnath Construction & Developers</p>
            <p><strong>Authorized Signatory</strong></p>
        </div>
    </div>
</body>
</html>