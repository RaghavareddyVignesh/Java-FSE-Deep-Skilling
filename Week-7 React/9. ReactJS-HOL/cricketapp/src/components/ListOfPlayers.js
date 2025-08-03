import React from 'react';

const ListofPlayers = ({ players }) => {
  return (
    <div>
      <ul>
        {players.map((item, index) => (
          <li key={index}>Mr. {item.name} - Score: {item.score}</li>
        ))}
      </ul>
    </div>
  );
};

export default ListofPlayers;