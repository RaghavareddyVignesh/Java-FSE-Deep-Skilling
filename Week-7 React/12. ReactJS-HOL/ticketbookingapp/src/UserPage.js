import React from 'react';

function UserPage() {
  const handleBooking = (e) => {
    e.preventDefault();
    // In a real app, add ticket booking logic here
    alert("Ticket booked successfully!");
  };

  return (
    <div>
      <h1>Book Your Ticket</h1>
      <form onSubmit={handleBooking}>
        <div style={{ marginBottom: '10px' }}>
          <label htmlFor="flightNumber">Flight Number: </label>
          <input type="text" id="flightNumber" name="flightNumber" required />
        </div>
        <div style={{ marginBottom: '10px' }}>
          <label htmlFor="passengerName">Passenger Name: </label>
          <input type="text" id="passengerName" name="passengerName" required />
        </div>
        <button type="submit">Book Ticket</button>
      </form>
    </div>
  );
}

export default UserPage;