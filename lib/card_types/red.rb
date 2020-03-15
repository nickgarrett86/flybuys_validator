module CardTypes
  module Red
    def self.match?(number)
      number.length == 16 &&
        number.start_with?('6014352')
    end

    def self.name
      "Fly Buys Red"
    end
  end
end
