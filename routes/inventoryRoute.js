// Needed Resources 
const express = require("express")
const router = new express.Router() 
const invController = require("../controllers/inventoryController")
const utilities = require("../utilities/")
const regValidate = require('../utilities/inventory-validation')

// Route to build inventory by classification view
router.get("/type/:classificationId", utilities.handleErrors(invController.buildByClassificationId))

// Route to build inventory item detail view
router.get("/detail/:inv_id", utilities.handleErrors(invController.buildByInvId))

// Route to build management view
router.get("/", utilities.checkLogin, utilities.handleErrors(invController.buildManagement))

// Route to build add classification view
router.get("/add-classification", utilities.checkLogin, utilities.handleErrors(invController.buildAddClassification))

// Process the add classification
router.post(
    "/add-classification",
    regValidate.classificationRules(),
    regValidate.checkClassificationData,
    utilities.handleErrors(invController.addClassification)
)

// Route to build add inventory view
router.get("/add-inventory", utilities.checkLogin, utilities.handleErrors(invController.buildAddInventory))

// Process the add inventory
router.post(
    "/add-inventory",
    regValidate.inventoryRules(),
    regValidate.checkInventoryData,
    utilities.handleErrors(invController.addInventory)
)

// Route to get inventory for AJAX request
router.get("/getInventory/:classification_id", utilities.handleErrors(invController.getInventoryJSON))

module.exports = router