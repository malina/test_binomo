angular.module('TestApp').controller 'UsersCtrl', [
  '$scope'
  '$rootScope'
  'Users'
  ($scope, $rootScope, Users) ->
    $rootScope.current_page = 'users'

    new_user = ->
      Users.get { id: 'new' }, (data) ->
        $scope.user = data
        $scope.user.time_zone = timezone.name()

    $scope.users = Users.query()
    new_user()

    $scope.submit = (user_data) ->
      $scope.user = _.merge($scope.user, user_data)
      $scope.user.$create().then (data) ->
        $scope.users = [ data ].concat($scope.users)
        new_user()

    $scope.destroy = (user) ->
      user.$remove().then (data) ->
        $scope.users = Users.query()

]
