class Todo.Routers.Todos extends Backbone.Router
  routes:
    '': 'index'
  
  initialize: ->
    @collection = new Todo.Collections.Todos()
    @container = $('#container')
    @collection.reset @container.data('todos')
  
  index: ->
    @container.empty()
    view = new Todo.Views.Index(collection: @collection)
    @container.html(view.render().el)


