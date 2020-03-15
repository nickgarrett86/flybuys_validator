module CardTypes
  module Green
    def self.match?(number)
      number.length == 16 &&
        number.match?(/\A601435552[6..9]/)
    end

    def self.name
      "Fly Buys Green"
    end
  end
end
