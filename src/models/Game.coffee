class window.Game extends Backbone.Model
  initialize: (@deck)->
    @set 'playerHand', @deck.dealPlayer()
    @set 'dealerHand', @deck.dealDealer()

    @get('playerHand').on 'stand', => @dealerStart()
    # @get('playerHand').on 'bust', => @playerLoses()
    # @get('dealerHand').on 'stand', => @compareHands()
    # @get('dealerHand').on 'bust', => @playerWins()

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
  
  dealerStart: ->
    @get('dealerHand').revealHand()


  dealerHitOrStay: ->
    dealerPossibilities = @get('dealerHand').scores()
    console.log dealerPossibilities 
