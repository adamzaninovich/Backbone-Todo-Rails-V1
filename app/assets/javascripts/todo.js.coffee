window.Todo =
  Models: {}
  Collections: {}
  Views: {}
  Routers: {}
  init: -> 
    @App = new Todo.Routers.Todos()
    Backbone.history.start pushState: true

$(document).ready ->
  Todo.init()
