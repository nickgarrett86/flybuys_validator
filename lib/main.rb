class Main
  def initialize(interface = ConsoleInterface)
    @interface = interface
  end

  def call
    card_numbers = sanitize(interface.card_numbers)
    card_numbers.each do |card_number|
      validator = CardValidator.new(card_number)
      interface.card_details(validator)
    end
  end

  private

  def sanitize(numbers)
    numbers.map { |number| number.delete(' ') }
  end

  attr_reader :interface
end
