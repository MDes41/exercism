//
// This is only a SKELETON file for the "Bob" exercise. It's been provided as a
// convenience to get you started writing code faster.
//

var Bob = function() {};

Bob.prototype.hey = function(input) {

var inputOnlyLetters = input.replace(/[^a-zA-Z]+/g, '');
var onlySpaces = input.replace(/[^a-zA-Z0-9]+/g, '');

function noLetter (input) {
	return inputOnlyLetters === '';
};

function upperCase (input) {
	return input.toUpperCase() === input;
};

function isQuestion (input) {
	return input.slice(-1) === '?'; 
};

if (onlySpaces === '') {
	return 'Fine. Be that way!';
} else if (upperCase(input) && !noLetter(input)) {
	return 'Whoa, chill out!';
} else if (isQuestion(input)) {
	return 'Sure.';
} else {
	return 'Whatever.';
}

};

module.exports = Bob;
