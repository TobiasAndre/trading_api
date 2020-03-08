# frozen_string_literal: true

class CoordinatesConverter
  ConverterError = Class.new(StandardError)

  class << self
    # example input (4230,N)
    def dms_to_decimal(value, orientation)
      coordinate = (value.to_f / 100).to_f
      decimal_part = BigDecimal(coordinate.to_s).to_f.modulo(1) * 100 / 60
      coordinate_converted = coordinate.to_i + decimal_part
      return coordinate_converted * -1 if negative_coordinate?(orientation)

      coordinate_converted
    rescue StandardError
      raise ConverterError
    end

    def negative_coordinate?(value)
      value.include?("W") || value.include?("S")
    end
  end
end
