module CardChecksum
  def self.for(card_number)
    length = card_number.length
    card_number.split('').map(&:to_i).map.with_index do |digit, index|
      diff = length - index

      # double all digits where distance from final index % 2 is 0
      # same as saying multiple by 2 - diff % 0
      num = digit * (2 - diff % 2)

      num.digits.sum
    end.sum
  end
end
