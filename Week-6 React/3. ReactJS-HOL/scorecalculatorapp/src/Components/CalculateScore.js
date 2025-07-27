import React from 'react';
import '../Stylesheets/mystyle.css';

function CalculateScore() {
  const name = "Vignesh";
  const school = "RMKCET";
  const total = 450;
  const percentage = total / 500 * 100;

  return (
    <div className="score-container">
      <h1>Student Details: </h1>
      <p><strong>Name:</strong> {name}</p>
      <p><strong>School:</strong> {school}</p>
      <p><strong>Total Marks:</strong> {total}</p>
      <p><strong>Percentage:</strong> {percentage} %</p>
    </div>
  );
}

export default CalculateScore;