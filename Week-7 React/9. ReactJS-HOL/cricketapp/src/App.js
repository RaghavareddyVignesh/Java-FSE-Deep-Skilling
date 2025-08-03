import React from 'react';
import ListofPlayers from './components/ListOfPlayers';
import Scorebelow70 from './components/ScoreBelow70';
import OddPlayers from './components/OddPlayers';
import EvenPlayers from './components/EvenPlayers';
import ListofIndianPlayers from './components/ListOfIndianPlayers';

function App() {
  const flag = false; // Change to true to test different output

  const players = [
    { name: 'Virat', score: 85 },
    { name: 'Rohit', score: 90 },
    { name: 'Dhoni', score: 65 },
    { name: 'Sachin', score: 100 },
    { name: 'Rahul', score: 45 },
    { name: 'Yuvi', score: 75 },
    { name: 'Pant', score: 55 },
    { name: 'Shreyas', score: 60 },
    { name: 'Shikhar', score: 70 },
    { name: 'Hardik', score: 80 },
    { name: 'Bumrah', score: 50 }
  ];

  const T20Players = ['Kohli', 'Rohit', 'Gill'];
  const RanjiTrophyPlayers = ['Rahane', 'Pujara', 'Iyer'];
  const indianPlayers = [...T20Players, ...RanjiTrophyPlayers];

  return (
    <div style={{ padding: '20px' }}>
      {flag ? (
        <>
          <h2>All Players</h2>
          <ListofPlayers players={players} />
          <hr />
          <h2>Players with Score Below 70</h2>
          <Scorebelow70 players={players} />
        </>
      ) : (
        <>
          <h2>Odd Players</h2>
          <OddPlayers players={indianPlayers} />
          <hr />
          <h2>Even Players</h2>
          <EvenPlayers players={indianPlayers} />
          <hr />
          <h2>Merged Indian Team</h2>
          <ListofIndianPlayers players={indianPlayers} />
        </>
      )}
    </div>
  );
}

export default App;