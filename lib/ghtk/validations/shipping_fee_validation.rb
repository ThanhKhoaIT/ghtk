module Ghtk::Validations
  class ShippingFeeValidation

    def initialize(hash)
      @hash = hash
    end

    def validate!
      blank_params = REQUIRED_PARAMS.select { |key| Ghtk.is_blank?(hash[key]) }
      raise Ghtk::BadParamsError.new("Params: #{blank_params.join(', ')} is blank!") unless blank_params.empty?
      return true
    end

    private

    attr_reader :hash

    REQUIRED_PARAMS = [
      :pick_province,
      :pick_district,
      :province,
      :district,
      :weight
    ]

  end
end
