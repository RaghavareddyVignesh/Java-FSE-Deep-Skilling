import React, { useState } from 'react';
import GuestPage from './GuestPage';
import UserPage from './UserPage';

function App() {
  // isLoggedIn is a simple flag for authentication
  const [isLoggedIn, setLoggedIn] = useState(false);

  // Handler for logging in: In a real app, add authentication logic here.
  const handleLogin = () => {
    setLoggedIn(true);
  };

  // Handler for logging out.
  const handleLogout = () => {
    setLoggedIn(false);
  };

  return (
    <div>
      <header style={{ padding: '10px', backgroundColor: '#f0f0f0' }}>
        {/* Conditionally render Login/Logout buttons */}
        {isLoggedIn ? (
          <button onClick={handleLogout}>Logout</button>
        ) : (
          <button onClick={handleLogin}>Login</button>
        )}
      </header>
      <main style={{ padding: '20px' }}>
        {/* Conditionally display the Guest or User page */}
        {isLoggedIn ? <UserPage /> : <GuestPage />}
      </main>
    </div>
  );
}

export default App;