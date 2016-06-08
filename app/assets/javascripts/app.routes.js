angular
  .module('family-tree')
  .config(['$routeProvider', RouteProvider]);

function RouteProvider($routeProvider) {
  $routeProvider.when('/', {
    templateUrl: 'views/index.html',
    controller: 'HomeController as vm'
  }).when('/tree/:id', {
    templateUrl: 'views/tree.html',
    controller: 'TreeController as vm'
  }).otherwise({
    redirectTo: '/'
  });
}