var Pangram = function (string) {
  this.string = string
}

filterOut = function (value) {
  value !== this
}

Pangram.prototype.isPangram = function () {
  var string = this.string.replace(/\s/g, '').toLowerCase().split('')
  var alphabet = 'abcdefghijklmnopqrstuvwxyz'.split('')
  for(var i=0; i < string.length; i++) {
    var indexOfSplice = alphabet.indexOf(string[i])
    if( indexOfSplice > -1 ) {
      alphabet.splice(indexOfSplice, 1)
    }
  }
  return alphabet.length == 0


}

module.exports = Pangram