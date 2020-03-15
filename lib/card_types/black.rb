module CardTypes
  module Black
    def self.match?(number)
      [16, 17].include?(number.length) &&
        number.start_with?('60141')
    end

    def self.name
      "Fly Buys Black"
    end
  end
end
