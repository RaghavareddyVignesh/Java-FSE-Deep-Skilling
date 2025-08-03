import React from 'react';

const BookDetails = ({ books, show }) => {
  return (
    <div className="st2">
      <h1>Book Details</h1>
      {show ? (
        <ul>
          {books.map((book) => (
            <div key={book.id}>
              <h3>{book.bname}</h3>
              <h4>{book.price}</h4>
            </div>
          ))}
        </ul>
      ) : (
        <p>No book data to display</p>
      )}
    </div>
  );
};

export default BookDetails;