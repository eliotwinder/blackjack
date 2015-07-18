class window.Game extends Backbone.Model
  initialize: (@deck)->
    @set 'playerHand', @deck.dealPlayer()
    @set 'dealerHand', @deck.dealDealer()

    @get('playerHand').on 'stand', => @dealerStart()
    @get('playerHand').on 'bust', => @playerLoses()
    @get('dealerHand').on 'stand', => @compareHands()
    @get('dealerHand').on 'bust', => @playerWins()

  compareHands: ->
    
    playerScore = @get('playerHand').returnBestScore()
    dealerScore = @get('dealerHand').returnBestScore()

    console.log(playerScore, dealerScore)
    
    if playerScore > dealerScore and playerScore <= 21
      @playerWins()
    else if playerScore <= 21 and dealerScore > 21
      @playerWins()
    else
      @playerLoses()

  dealerStart: ->
    @get('dealerHand').revealHand()
    @dealerHitOrStay()


  dealerHitOrStay: ->
    dealerPossibilities = @get('dealerHand').scores()
    
    if dealerPossibilities[0] < 17 
      @get('dealerHand').hit() 
      @dealerHitOrStay()
    else if dealerPossibilities[0] > 17
      @get('dealerHand').stand()
    else if dealerPossibilities[1] == 17 and dealerPossibilities[0] < 17
      @get('dealerHand').hit()
    else
      @get('dealerHand').stand()

  playerWins: ->
    console.log 'YOU ARE WIN!'

  playerLoses: ->
    console.log 'you are a poor card player and a bad person'
