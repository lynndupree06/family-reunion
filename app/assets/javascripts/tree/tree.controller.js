angular
  .module('family-tree')
  .controller('TreeController', TreeController);

TreeController.$inject = [
  '$routeParams',
  'TreeService'
];

function TreeController($routeParams, TreeService) {
  var vm = this;
  vm.rootPersonId = $routeParams.id;

  vm.init = function() {
    TreeService.hierarchical({id: vm.rootPersonId}, function (result) {
      vm.family = result;
    });
  };

  vm.getImage = function (avatar) {
    if(avatar) {
      return 'http://res.cloudinary.com/brazelton/image/upload/c_fill,g_face,w_100,h_100/' + avatar + '.jpg';
    }

    return 'http://res.cloudinary.com/brazelton/image/upload/w_100,h_100,c_fill/missing-image.png';
  };

  vm.getChildHrLineWidth = function(childrenLength) {
    if(childrenLength === 1) {
      return '1px';
    } else if(childrenLength > 6) {
      return '100%';
    } else {
      return (childrenLength * 150) + 'px';
    }
  };

  vm.init();
}