assert = chai.assert

describe 'game', ->
  deck = null
  hand = null
  game = null
  


  describe 'compareHands', ->  
    beforeEach ->
      deck = new Deck()
      game = new Game(deck)
    
    it 'should know if the player won', ->
      playerSpy1 = sinon.spy game, 'playerWins'
      dealersCard1 = new Card rank: 1, suit: 0
      dealersCard2 = new Card rank: 1, suit: 0
      playersCard1 = new Card rank: 9, suit: 0
      playersCard2 = new Card rank: 9, suit: 0
      game.set 'dealerHand', new Hand [dealersCard1, dealersCard2], deck, true

      game.compareHands()

      expect(playerSpy1.called).to.equal(true)  

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

    beforeEach ->
      deck = new Deck()
      game = new Game(deck)
    
    it 'should start the dealer', ->
      dealerSpy = sinon.spy game, 'dealerStart'

      game.get('playerHand').stand()

      expect(dealerSpy.called).to.equal(true)

    it 'should hit on less than 17', ->
      dealerSpy1 = sinon.spy game.get('dealerHand'), 'hit'
      dealersCard1 = new Card rank: 4, suit: 0
      dealersCard2 = new Card rank: 5, suit: 0
      game.set 'dealerHand', new Hand [dealersCard1, dealersCard2], deck, true

      game.get('playerHand').stand()

      expect(dealerSpy1.called).to.equal(true)


    it 'should hit on soft 17', ->

    it 'should stand on hard 17', ->

    it 'should stand on higher than 17', ->

