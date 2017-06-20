var Year = function (year) {
	this.year = year;
};

Year.prototype.isLeap  = function() {
	var year = this.year;
	var isLeap = false

	if (year % 4 == 0) {
		if ((year % 100 !== 0) || ((year % 100 === 0) && (year % 400 === 0))) {
			isLeap =  true
		}
	}; 

	return isLeap
};


module.exports = Year


