<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Transport Reports Page</title>
    <link href="https://fonts.googleapis.com/css2?family=Poppins:wght@300;400;500;600&display=swap" rel="stylesheet">
    <style>
        * {
            margin: 0;
            padding: 0;
            box-sizing: border-box;
        }

        body, html {
            font-family: 'Poppins', sans-serif;
            background-color: #f4f6f9;
            color: #2C3E50;
        }

        .container {
            max-width: 1200px;
            margin: 0 auto;
            padding: 20px;
        }

        /* Page Header */
        .page-header {
            display: flex;
            justify-content: space-between;
            align-items: center;
            margin-bottom: 30px;
        }

        .page-header h1 {
            font-size: 28px;
            font-weight: 500;
        }

        .btn {
            padding: 10px 20px;
            background-color: #2980b9;
            color: white;
            text-decoration: none;
            border-radius: 5px;
            cursor: pointer;
        }

        /* Filters Section */
        .filters {
            display: flex;
            justify-content: space-between;
            margin-bottom: 20px;
            padding: 10px;
            background-color: #fff;
            border-radius: 5px;
            box-shadow: 0 2px 10px rgba(0, 0, 0, 0.1);
        }

        .filters select, .filters input {
            padding: 10px;
            border: 1px solid #ddd;
            border-radius: 5px;
            width: 200px;
        }

        .filters button {
            padding: 10px 15px;
            background-color: #27ae60;
            color: white;
            border: none;
            border-radius: 5px;
            cursor: pointer;
        }

        .filters button:hover {
            background-color: #2ecc71;
        }

        /* Charts Section */
        .charts-grid {
            display: grid;
            grid-template-columns: repeat(auto-fit, minmax(350px, 1fr));
            gap: 20px;
            margin-bottom: 30px;
        }

        .chart-card {
            background-color: #fff;
            border-radius: 8px;
            padding: 20px;
            box-shadow: 0 2px 10px rgba(0, 0, 0, 0.1);
            text-align: center;
        }

        .chart-card h3 {
            margin-bottom: 15px;
            font-size: 18px;
        }

        /* Table Section */
        table {
            width: 100%;
            border-collapse: collapse;
            background-color: #fff;
            border-radius: 5px;
            box-shadow: 0 2px 10px rgba(0, 0, 0, 0.1);
        }

        table thead {
            background-color: #2980b9;
            color: white;
        }

        table th, table td {
            padding: 15px;
            text-align: left;
            border: 1px solid #ddd;
        }

        table tbody tr:nth-child(even) {
            background-color: #f2f2f2;
        }

        table tbody tr:hover {
            background-color: #f4f4f4;
            cursor: pointer;
        }

        /* Export Button */
        .export-btn {
            background-color: #e67e22;
            color: white;
            border: none;
            padding: 10px 20px;
            border-radius: 5px;
            cursor: pointer;
        }

        .export-btn:hover {
            background-color: #d35400;
        }

        /* Responsive Design */
        @media (max-width: 768px) {
            .filters {
                flex-direction: column;
            }

            .filters select, .filters input {
                margin-bottom: 10px;
                width: 100%;
            }

            .charts-grid {
                grid-template-columns: 1fr;
            }
        }
    </style>
</head>
<body>

    <div class="container">
        <!-- Page Header -->
        <div class="page-header">
            <h1>Reports</h1>
            <button class="export-btn">Export Report</button>
        </div>

        <!-- Filters Section -->
        <div class="filters">
            <select>
                <option value="">Filter by Vehicle</option>
                <option value="truck">Truck</option>
                <option value="van">Van</option>
                <option value="suv">SUV</option>
            </select>
            <input type="date" placeholder="From Date">
            <input type="date" placeholder="To Date">
            <button>Apply Filters</button>
        </div>

        <!-- Charts Section -->
        <div class="charts-grid">
            <div class="chart-card">
                <h3>Vehicle Usage</h3>
                <canvas id="vehicleUsageChart"></canvas>
            </div>
            <div class="chart-card">
                <h3>Delivery Performance</h3>
                <canvas id="deliveryPerformanceChart"></canvas>
            </div>
            <div class="chart-card">
                <h3>Fuel Consumption</h3>
                <canvas id="fuelConsumptionChart"></canvas>
            </div>
        </div>

        <!-- Reports Table -->
        <table>
            <thead>
                <tr>
                    <th>Vehicle</th>
                    <th>Total Deliveries</th>
                    <th>Distance Traveled</th>
                    <th>Fuel Consumption</th>
                    <th>Status</th>
                </tr>
            </thead>
            <tbody>
                <tr>
                    <td>Truck 01</td>
                    <td>35</td>
                    <td>1500 km</td>
                    <td>120 L</td>
                    <td>Active</td>
                </tr>
                <tr>
                    <td>Van 02</td>
                    <td>28</td>
                    <td>1100 km</td>
                    <td>90 L</td>
                    <td>Maintenance</td>
                </tr>
                <tr>
                    <td>SUV 03</td>
                    <td>15</td>
                    <td>600 km</td>
                    <td>50 L</td>
                    <td>Inactive</td>
                </tr>
            </tbody>
        </table>
    </div>

    <!-- Chart.js Library -->
    <script src="https://cdn.jsdelivr.net/npm/chart.js"></script>
    <script>
        // Vehicle Usage Chart
        const vehicleUsageCtx = document.getElementById('vehicleUsageChart').getContext('2d');
        new Chart(vehicleUsageCtx, {
            type: 'bar',
            data: {
                labels: ['Truck', 'Van', 'SUV'],
                datasets: [{
                    label: 'Vehicle Usage',
                    data: [1200, 800, 600],
                    backgroundColor: ['#3498db', '#e67e22', '#2ecc71']
                }]
            }
        });

        // Delivery Performance Chart
        const deliveryPerformanceCtx = document.getElementById('deliveryPerformanceChart').getContext('2d');
        new Chart(deliveryPerformanceCtx, {
            type: 'line',
            data: {
                labels: ['January', 'February', 'March', 'April'],
                datasets: [{
                    label: 'Deliveries',
                    data: [30, 45, 28, 60],
                    backgroundColor: 'rgba(46, 204, 113, 0.2)',
                    borderColor: '#27ae60',
                    fill: true
                }]
            }
        });

        // Fuel Consumption Chart
        const fuelConsumptionCtx = document.getElementById('fuelConsumptionChart').getContext('2d');
        new Chart(fuelConsumptionCtx, {
            type: 'pie',
            data: {
                labels: ['Truck', 'Van', 'SUV'],
                datasets: [{
                    label: 'Fuel Consumption',
                    data: [120, 90, 50],
                    backgroundColor: ['#3498db', '#e74c3c', '#2ecc71']
                }]
            }
        });
    </script>

</body>
</html>
