angular
  .module('family-tree')
  .filter('age', AgeFilter);

function AgeFilter() {
  return function(input) {
    if(input) {
      var birthdate = new moment(input);
      var today = new moment();
      return today.diff(birthdate, 'years')
    }

    return input;
  };
}