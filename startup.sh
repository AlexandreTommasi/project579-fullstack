#!/bin/bash

echo "Starting Full Stack Application..."

# Navigate to the deployment directory
cd /home/site/wwwroot

# Start backend API server
echo "Starting backend API on port 3001..."
cd backend
PORT=3001 npm start &
BACKEND_PID=$!

# Wait for backend to be ready
sleep 5

# Start frontend Next.js server
echo "Starting frontend on port 8080..."
cd ../frontend
PORT=8080 npm start &
FRONTEND_PID=$!

# Keep the script running
echo "Application started successfully!"
echo "Backend PID: $BACKEND_PID"
echo "Frontend PID: $FRONTEND_PID"

# Wait for both processes
wait $BACKEND_PID $FRONTEND_PID