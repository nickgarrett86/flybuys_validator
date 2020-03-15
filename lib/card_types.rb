module CardTypes
  TYPES = [
    CardTypes::Black,
    CardTypes::Red,
    CardTypes::Green,
    CardTypes::Blue
  ].freeze

  def self.for(number)
    (
      TYPES.find { |type| type.match?(number) } ||
      CardTypes::Unknown
    ).name
  end
end
