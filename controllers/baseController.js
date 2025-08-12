const utilities = require("../utilities/"); 
const baseController = {}; 

/* ************************
 * Build the home view
 * ************************ */
baseController.buildHome = async function (req, res) {
  const nav = await utilities.getNav(); // ← and here
  // req.flash("notice", "This is a flash message.");
  res.render("index", { title: "Home", nav }); 
};

module.exports = baseController; 
