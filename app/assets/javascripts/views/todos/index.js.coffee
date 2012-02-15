class Todo.Views.Index extends Backbone.View
  template: JST['todos/index']
  
  events:
    'keypress #new-todo'    : "createOnEnter"
    'keyup    #new-todo'    : "showTooltip"
    'click    .todo-clear a': "clearCompleted"
  
  initialize: ->
    @collection.on 'reset', @render
    @collection.on 'add', @appendTodo
  
  render: =>
    console.log 'rendering'
    $(@el).html(@template())
    @collection.each @appendTodo
    @renderStats()
    this
  
  appendTodo: (todo) =>
    view = new Todo.Views.Todo(model: todo)
    @$('#todo-list').append view.render().el
  
  renderStats: =>
    view = new Todo.Views.Stats(collection: @collection)
    @$('#todo-stats').html(view.render().el)
  
  createOnEnter: (event) ->
    text = @$('#new-todo').val()
    if text and event.keyCode is 13
      @collection.create title: text
      @$('#new-todo').val('')
  
  showTooltip: ->
    tooltip = @$('.ui-tooltip-top')
    text = @$('#new-todo').val()
    tooltip.fadeOut()
    if @tooltipTimeout
      clearTimeout @tooltipTimeout
    if text isnt '' and text isnt @$('#new-todo').attr('placeholder')
      show = -> tooltip.show().fadeIn()
      @tooltipTimeout = _.delay(show, 1000)
  
  clearCompleted: ->
    _.each @collection.completed(), (todo) ->
      todo.destroy silent: true
    
    @collection.trigger 'reset'
  
