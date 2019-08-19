module Ghtk::Validations
  class ShippingFeeValidation

    def initialize(serializer)
      @serializer = serializer
    end

    def valid!
      serializer_attributes = serializer.attributes
      blank_params = REQUIRED_PARAMS.select { |key| serializer_attributes[key].blank? }
      raise Ghtk::BadParamsError.new("Params: #{blank_params.join(', ')} is blank!") if blank_params.any?
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
