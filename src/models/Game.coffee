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
    
    if playerScore > dealerScore then  @playerWins() else @playerLoses()


  dealerStart: ->
    @get('dealerHand').revealHand()
    @dealerHitOrStay()


  dealerHitOrStay: ->
    dealerPossibilities = @get('dealerHand').scores()
    switch 
        when dealerPossibilities[1] < 17 
            @get('dealerHand').hit() 
            @dealerHitOrStay()
        when dealerPossibilities[1] > 17 and dealerPossibilities[1] <22
          @get('dealerHand').stand()
        else 
          if dealerPossibilities[0] == 17
            @get('dealerHand').stand()
          else
            @get('dealerHand').hit()
            @dealerHitOrStay()

  playerWins: ->
    console.log 'YOU ARE WIN!'

  playerLoses: ->
    console.log 'you are a poor card player and a bad person'
