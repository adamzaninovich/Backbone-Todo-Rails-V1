class Todo.Views.Stats extends Backbone.View
  template: JST['todos/stats']
  
  initialize: ->
    @collection.on 'change:completed',  @render
    #@collection.on 'add',               @render
    @collection.on 'remove',            @render
  
  render: =>
    console.log 'rendering stats'
    $(@el).html(@template(todos: @collection))
    this
  
