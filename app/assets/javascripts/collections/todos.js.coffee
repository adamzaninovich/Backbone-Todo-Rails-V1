class Todo.Collections.Todos extends Backbone.Collection
  model: Todo.Models.Todo
  url: '/api/todos'
    
  completed: ->
    @filter (todo) -> todo.get 'completed'
  
  remaining: ->
    @without.apply this, @completed()
