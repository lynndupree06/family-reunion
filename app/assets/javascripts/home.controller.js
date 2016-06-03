angular
  .module('family-tree')
  .controller('HomeController', HomeController);

HomeController.$inject = [
  'PeopleService',
  '$uibModal',
  '$log'
];

function HomeController(PeopleService, $uibModal, $log) {
  var vm = this;

  vm.init = function () {
    PeopleService.list(function (result) {
      vm.people = result;
    });
  };

  vm.getImage = function (avatar) {
    if(avatar) {
      return 'http://res.cloudinary.com/brazelton/image/upload/c_fill,g_face,w_100,h_100/' + avatar + '.jpg';
    }

    return 'http://res.cloudinary.com/brazelton/image/upload/w_100,h_100,c_fill/missing-image.png';
  };

  vm.showDetails = function (person) {
    var modalInstance = $uibModal.open({
      animation: true,
      templateUrl: 'views/person-details.html',
      controller: 'PersonController as vm',
      size: 'md',
      resolve: {
        person: function () {
          return person;
        }
      }
    });

    modalInstance.result.then(function (selectedItem) {
      $scope.selected = selectedItem;
    }, function () {
      $log.info('Modal dismissed at: ' + new Date());
    });
  };

  vm.search = function () {
    console.log('search!');
  };

  vm.init();
}