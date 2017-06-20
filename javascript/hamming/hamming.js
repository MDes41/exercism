var Hamming = function() {};

Hamming.prototype.compute  = function(a, b) {

	var A = a.split("");
	var B = b.split("");
	var lettersLeft = 0

	if(a.length !== b.length) {
		throw new Error('DNA strands must be of equal length.');
	} else {
		for (var i = 0; i < A.length; i++) {
			if (A[i] !== B[i]) {
				lettersLeft += 1;
			};
		};
	return lettersLeft;
	};
};


module.exports = Hamming;