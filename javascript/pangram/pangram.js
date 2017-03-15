var Pangram = function (string) {
  this.string = string
}

filterOut = function (value) {
  value !== this
}

Pangram.prototype.isPangram = function () {
  var string = this.string.replace(/\s/g, '')
  var alphabet = 'abcdefghijklmnopqrstuvwxyz'.split('')
  for(var i=0; i < string.length; i++) {
    alphabet = alphabet.filter(filterOut, string.split('')[i].toLowerCase())
  }
  return alphabet.length


}

module.exports = Pangram