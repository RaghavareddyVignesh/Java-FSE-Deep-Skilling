import React from 'react';

const Scorebelow70 = ({ players }) => {
  const filtered = players.filter(p => p.score < 70);
  return (
    <div>
      <ul>
        {filtered.map((item, index) => (
          <li key={index}>Mr. {item.name} - Score: {item.score}</li>
        ))}
      </ul>
    </div>
  );
};

export default Scorebelow70;