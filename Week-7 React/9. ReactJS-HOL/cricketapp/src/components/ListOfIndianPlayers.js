import React from 'react';

const ListofIndianPlayers = ({ players }) => {
  return (
    <div>
      <ul>
        {players.map((player, index) => (
          <li key={index}>{player}</li>
        ))}
      </ul>
    </div>
  );
};

export default ListofIndianPlayers;