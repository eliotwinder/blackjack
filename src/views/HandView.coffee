class window.HandView extends Backbone.View
  className: 'hand'

  template: _.template '<h2><% if(isDealer){ %>Dealer<% }else{ %>You<% } %> (<span class="score"></span>)</h2>'

  initialize: ->
    @collection.on 'add remove change', => @render()
    @render()

  render: ->
    @$el.children().detach()
    @$el.html @template @collection
    @$el.append @collection.map (card) ->
      new CardView(model: card).$el
    
    scores = @collection.scores()
    if not @collection.isDealer  
      if @collection.hasAce() > 0 and scores[1] < 22 
        scoreText = scores[0] + "/" + scores[1]
      else
        scoreText = scores[0]
    else
      scoreText = @collection.returnShownScore()

      
    @$('.score').text scoreText

