import React from 'react';

const BlogDetails = ({ blogs }) => {
  return (
    <div className="v1">
      <h1>Blog Details</h1>
      {blogs.length > 0 &&
        blogs.map((blog, i) => (
          <div key={i}>
            <h2>{blog.title}</h2>
            <h4>{blog.author}</h4>
            <p>{blog.desc}</p>
          </div>
        ))}
    </div>
  );
};

export default BlogDetails;