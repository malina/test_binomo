angular.module('TestApp').config [
  '$stateProvider'
  '$urlRouterProvider'
  ($stateProvider, $urlRouterProvider) ->
    $urlRouterProvider.otherwise '/users'
    $stateProvider.state 'users',
      url: '/users'
      templateUrl: 'views/users/index.html'
      controller: 'UsersCtrl'
      resolve: Users: [
        'Resources'
        (Resources) ->
          Resources '/api/users/:id.json', id: '@id'
      ]
]
