class window.CardView extends Backbone.View
  className: 'card'

  initialize: -> @render()

  render: ->
    @$el.children().detach()
    console.log @model.get('rankName') + "-"
    if @model.get 'revealed' 
      @$el.css('background-image', 'url("img/cards/'+ 
        @model.get('rankName') + '-' + @model.get('suitName') + '.png")') 
    else @$el.addClass 'covered'


