class Todo.Views.Todo extends Backbone.View
  template: JST['todos/todo']
  tagName: 'li'
  
  events:
    'click    .check'         : "toggleCompleted"
    'dblclick .todo-text'     : "edit"
    'click    .todo-destroy'  : "clear"
    'keypress .todo-input'    : "updateOnEnter"
  
  initialize: ->
    @model.on 'change', @render
    @model.on 'destroy', @remove
    @model.on 'error', (todo, error) -> alert("item #{error}")
  
  render: =>
    $(@el).html(@template(todo: @model))
    this
  
  edit: ->
    $(@el).addClass 'editing'
    @$('.todo-input')
      .val(@model.get('title'))
      .focus()
      .on 'blur', =>
        @model.save title: @$('.todo-input').val()
        $(@el).removeClass 'editing'
  
  updateOnEnter: (event) ->
    @$('.todo-input').trigger('blur') if event.keyCode is 13
  
  toggleCompleted: ->
    @model.toggle()
  
  clear: ->
    @model.destroy()
  
  remove: =>
    $(@el).remove()
  
