const express = require('express');
const app = express();

app.use(express.text()); // Middleware to parse text/plain requests

// Respond to GET requests to the root URL
app.get('/', (req, res) => 
{
  res.send('Welcome to the Server!');
});

// Endpoint to receive data from the Arduino via POST
app.post('/data', (req, res) => 
{
  console.log('Data received from Arduino:', req.body);
  res.status(200).send('Data received');
});

// Error handling middleware
app.use((err, req, res, next) => 
{
  console.error(err.stack);
  res.status(500).send('Something broke!');
});

// Set the server to listen on a new port
const PORT = 3001;
app.listen(PORT, () => 
{
  console.log(`Server running on http://localhost:${PORT}`);
});


