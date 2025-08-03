import React from 'react';

const OddPlayers = ({ players }) => {
  const [first, , third, , fifth] = players;
  return (
    <div>
      <ul>
        <li>First: {first}</li>
        <li>Third: {third}</li>
        <li>Fifth: {fifth}</li>
      </ul>
    </div>
  );
};

export default OddPlayers;