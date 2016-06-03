angular
  .module('family-tree')
  .controller('PersonController', PersonController);

PersonController.$inject = [
  'person'
];

function PersonController(person) {
  var vm = this;
  vm.person = person;

  vm.getImage = function (avatar) {
    if(avatar) {
      return 'http://res.cloudinary.com/brazelton/image/upload/c_fill,g_face,w_100,h_100/' + avatar + '.jpg';
    }

    return 'http://res.cloudinary.com/brazelton/image/upload/w_100,h_150,c_fill/missing-image.png';
  };

  vm.inEditMode = function () {
    return false;
  };
}