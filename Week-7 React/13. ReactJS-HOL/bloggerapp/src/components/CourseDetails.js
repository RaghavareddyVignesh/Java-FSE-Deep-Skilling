import React from 'react';

const CourseDetails = ({ courses }) => {
  let content;

  if (courses.length > 0) {
    content = (
      <ul>
        {courses.map((course, index) => (
          <div key={index}>
            <h2>{course.cname}</h2>
            <h4>{course.date}</h4>
          </div>
        ))}
      </ul>
    );
  } else {
    content = <p>No courses available</p>;
  }

  return (
    <div className="mystyle1">
      <h1>Course Details</h1>
      {content}
    </div>
  );
};

export default CourseDetails;