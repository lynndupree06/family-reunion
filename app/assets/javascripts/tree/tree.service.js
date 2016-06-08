angular
  .module('family-tree')
  .factory('TreeService', ['$resource', TreeService]);

function TreeService($resource) {
  return $resource('/hierarchical/:id.json', {}, {
    hierarchical: { method: 'GET', isArray: true }
  });
}