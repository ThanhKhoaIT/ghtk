module Ghtk::Validations
  class OrderValidation

    def initialize(serializer)
      @serializer = serializer
    end

    def validate!
      blank_params = []
      serializer_attributes = serializer.attributes
      REQUIRED_PARAMS.each do |key, sub_keys|
        sub_keys.each do |sub_key|
          blank_params << "#{key}.#{sub_key}" if Ghtk.is_blank?(serializer_attributes.dig(key, sub_key))
        end
      end
      unless serializer_attributes.dig(:order, :use_return_address).to_i.zero?
        REQUIRED_RETURN_PARAMS.each do |key, sub_keys|
          sub_keys.each do |sub_key|
            blank_params << "#{key}.#{sub_key}" if Ghtk.is_blank?(serializer_attributes.dig(key, sub_key))
          end
        end
      end
      raise Ghtk::BadParamsError.new("Params: #{blank_params.join(', ')} is blank!") unless blank_params.empty?
      return true
    end

    private

    attr_reader :serializer

    REQUIRED_PARAMS = { order: [
      :id,
      :pick_name,
      :pick_money,
      :pick_address,
      :pick_province,
      :pick_district,
      :pick_tel,
      :name,
      :address,
      :province,
      :district,
      :tel,
      :email,
    ] }

    REQUIRED_RETURN_PARAMS = { order: [
      :return_name,
      :return_address,
      :return_province,
      :return_district,
      :return_tel,
      :return_email,
    ] }

  end
end
