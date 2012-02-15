class Todo.Models.Todo extends Backbone.Model
  defaults:
    completed: false
  
  validate: (attrs) -> "must not be blank" if attrs.title is ''
  
  toggle: -> @save completed: !@get 'completed'
