var _ = require("lodash");

var Etl = function() {};

Etl.prototype.transform = function(input) {


	reformattedInput = {}

	_.forEach(input, function(value, key) {
		_.forEach(value, function(letter) {
			reformattedInput[_.lowerCase(letter)] = _.toSafeInteger(key)
		});
	});

	return reformattedInput;

};

module.exports = Etl;
