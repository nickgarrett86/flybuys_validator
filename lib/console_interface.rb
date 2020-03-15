module ConsoleInterface
  def self.card_numbers
    gets(nil)&.split("\n") || []
  end

  def self.card_details(details)
    puts "#{details.type}: #{details.card_number} (#{valid_string(details.valid?)})"
  end

  def self.valid_string(valid)
    valid ? 'valid' : 'invalid'
  end
end
