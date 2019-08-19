module Ghtk::Validations
  class ShippingFeeValidation

    def initialize(serializer)
      @serializer = serializer
    end

    def validate!
      serializer_attributes = serializer.attributes
      blank_params = REQUIRED_PARAMS.select { |key| Ghtk.is_blank?(serializer_attributes[key]) }
      raise Ghtk::BadParamsError.new("Params: #{blank_params.join(', ')} is blank!") unless blank_params.empty?
      return true
    end

    private

    attr_reader :serializer

    REQUIRED_PARAMS = [
      :pick_province,
      :pick_district,
      :province,
      :district,
      :weight
    ]

  end
end
