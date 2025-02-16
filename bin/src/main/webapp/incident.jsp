<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Incident Management</title>
    <link href="https://fonts.googleapis.com/css2?family=Poppins:wght@300;400;500;600&display=swap" rel="stylesheet">
    <style>
        /* Global Styles */
        * {
            margin: 0;
            padding: 0;
            box-sizing: border-box;
        }

        body {
            font-family: 'Poppins', sans-serif;
            background-color: #f4f6f9;
            color: #2c3e50;
            padding: 20px;
        }

        h1, h2 {
            color: #34495e;
        }

        .container {
            max-width: 1200px;
            margin: auto;
            background-color: #fff;
            border-radius: 8px;
            box-shadow: 0 2px 10px rgba(0, 0, 0, 0.1);
            overflow: hidden;
        }

        .header {
            background-color: #3498db;
            color: white;
            padding: 20px;
            text-align: center;
            font-size: 24px;
            font-weight: 600;
        }

        /* Layout */
        .layout {
            display: flex;
            gap: 20px;
            padding: 20px;
        }

        .incident-list, .form-section, .comments-section {
            flex: 1;
            background-color: #ffffff;
            padding: 20px;
            border-radius: 8px;
            box-shadow: 0 2px 5px rgba(0, 0, 0, 0.1);
        }

        /* Incident List */
        .incident-list h2 {
            margin-bottom: 20px;
        }

        .incident-item {
            padding: 10px;
            border: 1px solid #ddd;
            border-radius: 4px;
            margin-bottom: 10px;
            cursor: pointer;
            transition: background-color 0.2s;
        }

        .incident-item:hover {
            background-color: #f0f8ff;
        }

        .incident-item.active {
            background-color: #dff0ff;
            border-color: #3498db;
        }

        /* Form Styles */
        .form-section h2 {
            margin-bottom: 20px;
        }

        .form-group {
            margin-bottom: 20px;
        }

        .form-group label {
            display: block;
            font-weight: 500;
            margin-bottom: 5px;
        }

        .form-group input, .form-group select, .form-group textarea {
            width: 100%;
            padding: 10px;
            border: 1px solid #ddd;
            border-radius: 4px;
            font-size: 16px;
        }

        .form-group textarea {
            height: 100px;
            resize: none;
        }

        .form-group button {
            background-color: #3498db;
            color: white;
            padding: 10px 20px;
            border: none;
            border-radius: 4px;
            font-size: 16px;
            cursor: pointer;
        }

        .form-group button:hover {
            background-color: #2980b9;
        }

        /* Comments Section */
        .comments-section h2 {
            margin-bottom: 20px;
        }

        .comment {
            background-color: #f9f9f9;
            padding: 15px;
            margin-bottom: 15px;
            border-radius: 8px;
            border: 1px solid #ddd;
        }

        .comment .author {
            font-weight: 600;
            margin-bottom: 5px;
        }

        .comment .time {
            font-size: 14px;
            color: #7f8c8d;
            margin-bottom: 10px;
        }

        .comment .text {
            font-size: 16px;
            line-height: 1.5;
        }

        .add-comment {
            display: flex;
            gap: 10px;
            margin-top: 20px;
        }

        .add-comment textarea {
            flex: 1;
            padding: 10px;
            border: 1px solid #ddd;
            border-radius: 4px;
            font-size: 16px;
            resize: none;
        }

        .add-comment button {
            background-color: #2ecc71;
            color: white;
            padding: 10px 20px;
            border: none;
            border-radius: 4px;
            font-size: 16px;
            cursor: pointer;
        }

        .add-comment button:hover {
            background-color: #27ae60;
        }

        /* Responsive Design */
        @media (max-width: 768px) {
            .layout {
                flex-direction: column;
            }
        }
    </style>
</head>
<body>
    <div class="container">
        <!-- Header -->
        <div class="header">Incident Management</div>

        <!-- Main Layout -->
        <div class="layout">
            <!-- Incident List Section -->
            <div class="incident-list">
                <h2>Incident List</h2>
                <div id="incident-list">
                    <!-- Dynamic incident items will be appended here -->
                </div>
            </div>

            <!-- Incident Form Section -->
            <div class="form-section">
                <h2>Incident Details</h2>
                <form id="incident-form">
                    <div class="form-group">
                        <label for="incident-id">Incident ID</label>
                        <input type="text" id="incident-id" name="incidentId" placeholder="Generated Automatically" readonly>
                    </div>
                    <div class="form-group">
                        <label for="priority">Priority</label>
                        <select id="priority" name="priority" required>
                            <option value="Low">Low</option>
                            <option value="Medium">Medium</option>
                            <option value="High">High</option>
                            <option value="Critical">Critical</option>
                        </select>
                    </div>
                    <div class="form-group">
                        <label for="description">Description</label>
                        <textarea id="description" name="description" placeholder="Describe the incident..." required></textarea>
                    </div>
                    <div class="form-group">
                        <button type="button" id="save-incident">Save Incident</button>
                    </div>
                </form>
            </div>

            <!-- Comments Section -->
            <div class="comments-section">
                <h2>Comments</h2>
                <div id="comments">
                    <p>No comments yet.</p>
                </div>
                <div class="add-comment">
                    <textarea id="new-comment" placeholder="Add a comment..."></textarea>
                    <button id="add-comment-btn">Post</button>
                </div>
            </div>
        </div>
    </div>

    <script>
		alert("This page is in development");
        const incidentList = document.getElementById('incident-list');
        const incidentForm = document.getElementById('incident-form');
        const incidentIdField = document.getElementById('incident-id');
        const priorityField = document.getElementById('priority');
        const descriptionField = document.getElementById('description');
        const saveIncidentBtn = document.getElementById('save-incident');
        const commentsSection = document.getElementById('comments');
        const newCommentField = document.getElementById('new-comment');

        // Dummy incidents
        const incidents = [
            { id: 'INC001', priority: 'High', description: 'System outage in region A.' },
            { id: 'INC002', priority: 'Medium', description: 'Email delivery failure for multiple users.' },
        ];

        // Load incidents into the list
        function loadIncidents() {
            incidentList.innerHTML = '';
            incidents.forEach((incident, index) => {
                const item = document.createElement('div');
                item.className = 'incident-item';
                item.textContent = `${incident.id} - ${incident.description}`;
                item.onclick = () => selectIncident(index);
                incidentList.appendChild(item);
            });
        }

        // Select an incident and populate the form
        function selectIncident(index) {
            const incident = incidents[index];
            incidentIdField.value = incident.id;
            priorityField.value = incident.priority;
            descriptionField.value = incident.description;

            // Highlight the selected incident
            document.querySelectorAll('.incident-item').forEach(item => item.classList.remove('active'));
            incidentList.children[index].classList.add('active');
        }

        // Save a new incident
        saveIncidentBtn.addEventListener('click', () => {
			const newId = `INC${('000253012')}`;


            const newIncident = {
                id: newId,
                priority: priorityField.value,
                description: descriptionField.value,
            };
            incidents.push(newIncident);
            loadIncidents();
            incidentForm.reset();
            incidentIdField.value = '';
            alert('Incident saved successfully!');
        });

        // Add a new comment
        document.getElementById('add-comment-btn').addEventListener('click', () => {
            const commentText = newCommentField.value.trim();
            if (!commentText) return alert('Please enter a comment.');

            const comment = document.createElement('div');
            comment.className = 'comment';
            comment.innerHTML = `
                <div class="author">You</div>
                <div class="time"></div>
                <div class="text">${commentText}</div>
            `;
            commentsSection.prepend(comment);
            newCommentField.value = '';
        });

        // Initial load
        loadIncidents();
    </script>
</body>
</html>
