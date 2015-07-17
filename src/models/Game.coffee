class window.Game extends Backbone.Model
  initialize: (@deck)->
    @set 'playerHand', @deck.dealPlayer()
    @set 'dealerHand', @deck.dealDealer()

    @get('playerHand').on 'stand', => @compareHands()

  compareHands: ->
    playerScores = @get('playerHand').scores()
    dealerScore = @get('dealerHand').scores()
    
    hasWon = true
    
    # Two possibilities
    if playerScores[0] != playerScores[1]
      console.log(playerScores)
    #only one possibility
    else 
      console.log playerScores[0]