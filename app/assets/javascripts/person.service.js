angular
  .module('family-tree')
  .factory('PeopleService', ['$resource', PeopleService]);

function PeopleService($resource) {
  return $resource('/people.json', {}, {
    list: { method: 'GET', isArray: true }
  });
}