module CardTypes
  module Unknown
    def self.match?(_number)
      true
    end

    def self.name
      'Unknown'
    end
  end
end
