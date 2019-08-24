module Ghtk
  class FlexibleParams

    attr_reader :hash

    def initialize(object)
      if object.is_a?(Hash)
        data = object
      elsif object.respond_to?(:as_json)
        data = object.as_json
      else
        data = object.attributes
      end
      @hash = data.to_deep_symbolize_keys
    end

  end
end
