class CardValidator
  attr_reader :card_number

  def initialize(card_number)
    @card_number = card_number
  end

  def valid?
    (CardChecksum.for(card_number) % 10).zero?
  end

  def type
    CardTypes.for(card_number)
  end
end
