const express = require('express');
const app = express();

app.use(express.text()); // Middleware to parse text/plain requests

// Respond to GET requests to the root URL
app.get('/', (req, res) => {
  let responseData = [
    "Past History:",
    "Your reading for Day 1 is: 15.3 mmHg",
    "Your reading for Day 2 is: 15.5 mmHg",
    "Your reading for Day 3 is: 15.7 mmHg",
    "Your reading for Day 4 is: 15.9 mmHg",
    "Your reading for Day 5 is: 16.1 mmHg",
    "Your reading for Day 6 is: 16.3 mmHg",
    "Your reading for Day 7 is: 16.5 mmHg",
    "Your reading for Day 8 is: 16.7 mmHg",
    "Your reading for Day 9 is: 16.9 mmHg",
    "Your reading for Day 10 is: 17.1 mmHg",
    "Your reading for Day 11 is: 18.3 mmHg",
    "Your reading for Day 12 is: 17.5 mmHg",
    "Your reading for Day 13 is: 17.7 mmHg",
    "Your reading for Day 14 is: 17.9 mmHg",
    "Your reading for Day 15 is: 18.1 mmHg"
  ].join('\n'); // Join each line with a newline character

  res.type('text/plain'); // Set the response type to text/plain
  res.send(responseData);
});

// Endpoint to receive data from the Arduino via POST
app.post('/data', (req, res) => {
  console.log('Data received from Arduino:', req.body);
  res.status(200).send('Data received');
});

// Error handling middleware
app.use((err, req, res, next) => {
  console.error(err.stack);
  res.status(500).send('Something broke!');
});

// Set the server to listen on a new port
const PORT = 3001;
app.listen(PORT, () => {
  console.log(`Server running on http://localhost:${PORT}`);
});
