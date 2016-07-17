// Created my needed NPM packages
var mysql = require('mysql');
var prompt = require('prompt');
var inquirer = require('inquirer');
var Table = require('cli-table');

// Created my SQL database connection
var connection = mysql.createConnection({
    host: "localhost",
    port: 3306,
    user: "root", 
    password: "", 
    database: "bamazon"
});

// Created a start function that will execute when the application begins.
var start = function() {
	connection.query("SELECT * FROM products", function(err, res) {
		showItems(res);
		setTimeout(function(){selectItem(res)}, 200);
	});
};

// Created a function that prompts the end-user to select an item.
var selectItem = function(res) {
	console.log("What item would you like to buy? Please enter an ID.");
	prompt.get(['id'], function (err, result) {
		if (result.id.charCodeAt() >= 48 && result.id.charCodeAt() <= 57) {
			for(var i=0; i<res.length; i++) {
				if(result.id == res[i].ItemID) {
					console.log("ID: " + res[i].ItemID + " | " + "Item: " + res[i].ProductName + " | " + "Department: " + res[i].DeptName + " | " + "Price: $" + res[i].Price + " | " + "Available: " + res[i].StockQty);
					selectQty(res[i]);
				};
			};
		} else {
			console.log("Please enter a valid ID");
			selectItem(res);
		};
	});
};

// Created a function that prompts the end-user to select a quantity for the item selected.
var selectQty = function(item) {
	console.log("How many would you like to buy?");
	prompt.get(['number'], function(err, result) {
		if(result.number.charCodeAt() >= 48 && result.number.charCodeAt() <= 57) {
			if(result.number > 0 && result.number <= item.StockQty) {
				console.log("Thank you for placing an order. The total for your order is: $" + (result.number * item.Price) + '\n');
				connection.query("UPDATE products SET StockQty = ? WHERE ItemID = ?", [(item.StockQty - result.number), item.ItemID], function(err, res) {});
				inquirer.prompt([
					{
						type: "confirm",
						message: "Would you like to continue shopping?",
						name: "choice"
					}
				]).then(function(answers) {
					if(answers.choice == true) {
						start();
					} else {
						process.exit();
					};
				});
			} else {
				console.log("** Insufficient quantity! **");
				console.log("Please adjust the quantity to less than or equal to: " + item.StockQty);
				selectQty(item);
			};
		} else {
			console.log("Please enter a valid quantity");
			selectQty(item);
		};
	});
};

// Created a function that shows all items in the database.
var showItems = function(res) {
		var table = new Table({
		head: ["ID", "Item", " Dept", "Price", "Quantity"]
	});
	res.forEach(function(item) {
		var itemArray = [];
		itemArray.push(item.ItemID);
		itemArray.push(item.ProductName);
		itemArray.push(item.DeptName);
		itemArray.push(item.Price);
		itemArray.push(item.StockQty);
		table.push(itemArray);
	});
	console.log(table.toString());
};

start();