import React from 'react';

function GuestPage() {
  const flights = [
    { id: 1, airline: "Airline A", flightNumber: "AA123", departure: "New York", arrival: "London", time: "10:00 AM" },
    { id: 2, airline: "Airline B", flightNumber: "BB456", departure: "Los Angeles", arrival: "Tokyo", time: "2:00 PM" },
    { id: 3, airline: "Airline C", flightNumber: "CC789", departure: "Paris", arrival: "Dubai", time: "6:00 PM" },
  ];

  return (
    <div>
      <h1>Flight Details</h1>
      <ul>
        {flights.map((flight) => (
          <li key={flight.id}>
            <strong>{flight.airline}</strong> - Flight {flight.flightNumber}:
            {` From ${flight.departure} to ${flight.arrival} at ${flight.time}`}
          </li>
        ))}
      </ul>
    </div>
  );
}

export default GuestPage;