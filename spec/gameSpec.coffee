assert = chai.assert

describe 'game', ->
  deck = null
  hand = null
  game = null
  

  beforeEach ->
    deck = new Deck()
    game = new Game(deck)

  describe 'compareHands', ->  
    

    it 'should know if the player won', ->
      playerSpy = sinon.spy game, 'playerWins'
      dealersCard1 = new Card rank: 1, suit: 0
      dealersCard2 = new Card rank: 1, suit: 0
      playersCard1 = new Card rank: 9, suit: 0
      playersCard2 = new Card rank: 9, suit: 0
      game.set 'dealerHand', new Hand [dealersCard1, dealersCard2], deck, true

      game.compareHands()

      expect(playerSpy.called).to.equal(true)  

    it 'should know if the player is a bad person', ->  
      playerSpy = sinon.spy game, 'playerLoses'
      dealersCard1 = new Card rank: 9, suit: 0
      dealersCard2 = new Card rank: 9, suit: 0
      playersCard1 = new Card rank: 8, suit: 0
      playersCard2 = new Card rank: 8, suit: 0
      game.set 'dealerHand', new Hand [dealersCard1, dealersCard2], deck, true

      game.compareHands()

      expect(playerSpy.called).to.equal(true)

  describe 'dealer behavior', ->

    # beforeEach ->
    #   deck = new Deck()
    #   game = new Game(deck)
    
    it 'should start the dealer', ->
      dealerSpy = sinon.spy game, 'dealerStart'

      game.get('playerHand').stand()

      expect(dealerSpy.called).to.equal(true)

    it 'should hit at on less than 17', ->

    it 'should hit on soft 17', ->

    it 'should stand on hard 17', ->

    it 'should stand on higher than 17', ->

