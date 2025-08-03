import React from 'react';
import BookDetails from './components/BookDetails';
import BlogDetails from './components/BlogDetails';
import CourseDetails from './components/CourseDetails';
import { books } from './data/books';
import { blogs } from './data/blogs';
import { courses } from './data/courses';
import './App.css';

function App() {
  const showBooks = true; // Try toggling this to false

  return (
    <div className="App">
      <div style={{ display: 'flex', justifyContent: 'space-around' }}>
        <BookDetails books={books} show={showBooks} />
        <BlogDetails blogs={blogs} />
        <CourseDetails courses={courses} />
      </div>
    </div>
  );
}

export default App;