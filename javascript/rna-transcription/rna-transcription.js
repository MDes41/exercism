function DnaTranscriber() {

};

DnaTranscriber.prototype.toRna = function(string) {
  var match = { 'C': 'G',
                'G': 'C',
                'A': 'U',
                'T': 'A'}
    result = []
  for(var i = 0; i < string.length; i++) {
    if(match[string[i]] == null) {throw 'Invalid input'}
    result.push(match[string[i]]);
  };
  return result.join('');
};

module.exports = DnaTranscriber;