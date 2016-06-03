angular
  .module('family-tree')
  .config(['$routeProvider', RouteProvider]);

function RouteProvider($routeProvider) {
  $routeProvider.when('/', {
    templateUrl: 'views/index.html',
    controller: 'HomeController as vm'
  }).otherwise({
    redirectTo: '/'
  });
}