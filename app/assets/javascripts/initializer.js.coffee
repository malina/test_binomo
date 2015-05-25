'use strict'
angular.module('TestApp', [
  'ng-rails-csrf'
  'ngResource'
  'ngRoute'
  'ngSanitize'
  'ngAnimate'
  'ui.bootstrap'
  'ui.router'
]).config([
  '$locationProvider'
  ($locationProvider) ->
    $locationProvider.html5Mode false
    $locationProvider.hashPrefix '!'
]).config([
  '$httpProvider'
  ($httpProvider) ->
    $httpProvider.interceptors.push 'requestInterceptor'
]).factory 'requestInterceptor', [
  '$q'
  '$rootScope'
  ($q, $rootScope) ->
    $rootScope.pendingRequests = 0
    {
      request: (config) ->
        $rootScope.pendingRequests++
        config or $q.when(config)
      requestError: (rejection) ->
        $rootScope.pendingRequests--
        $q.reject rejection
      response: (response) ->
        $rootScope.pendingRequests--
        response or $q.when(response)
      responseError: (rejection) ->
        $rootScope.pendingRequests--
        $q.reject rejection

    }
]
window.timezone = jstz.determine()
