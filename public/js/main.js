// main.js
// Runs after DOM is loaded

document.addEventListener("DOMContentLoaded", () => {
  console.log("JavaScript is running!");
  
  const heading = document.createElement("h1");
  heading.textContent = "Hello from main.js!";
  document.body.appendChild(heading);
});
