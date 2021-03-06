class window.Hand extends Backbone.Collection
  model: Card

  initialize: (array, @deck, @isDealer) ->

  hit: ->
    @add(@deck.pop())
    @checkBust()

  stand: ->
    @trigger 'stand', @


  hasAce: -> @reduce (memo, card) ->
    memo or card.get('value') is 1
  , 0

  minScore: -> @reduce (score, card) ->
    score + if card.get 'revealed' then card.get 'value' else 0
  , 0

  scores: ->
    # The scores are an array of potential scores.
    # Usually, that array contains one element. That is the only score.
    # when there is an ace, it offers you two scores - the original score, and score + 10.
    [@minScore(), @minScore() + 10 * @hasAce()]

  revealHand: ->
    @at(0).set 'revealed', true

  checkBust: ->
    scores = @scores()
    if scores[0] > 21 
      @trigger 'bust', @

  returnBestScore: ->
    scores = @scores()
    if scores[1] > 21 then return scores[0] else return scores[1]

  returnShownScore: ->
    score = 0
    allRevealed = true
    @forEach (card) ->
      if card.get 'revealed'
        score += card.get 'value'
      else
        allRevealed = false
    
    if allRevealed
      return @returnBestScore()
    else
      return score





