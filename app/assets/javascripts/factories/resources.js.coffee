angular.module('TestApp').factory 'Resources', [
  '$resource'
  ($resource) ->
    (url, urlDesc, proto) ->
      actions = undefined
      resources = undefined
      actions =
        save: method: 'PUT'
        create: method: 'POST'
        remove: method: 'DELETE'
      resources = $resource(url, urlDesc, actions)
]
