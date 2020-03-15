module CardTypes
  module Blue
    def self.match?(number)
      number.length == 16 &&
        number.start_with?('6014')
    end

    def self.name
      "Fly Buys Blue"
    end
  end
end
