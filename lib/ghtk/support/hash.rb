class Hash

  def to_deep_symbolize_keys
    to_deep_transform_keys { |key| key.to_sym rescue key }
  end

  def to_deep_transform_keys(&block)
    _to_deep_transform_keys_in_object(self, &block)
  end

  private

  def _to_deep_transform_keys_in_object(object, &block)
    case object
    when Hash
      object.each_with_object({}) do |(key, value), result|
        result[yield(key)] = _to_deep_transform_keys_in_object(value, &block)
      end
    when Array
      object.map { |e| _to_deep_transform_keys_in_object(e, &block) }
    else
      object
    end
  end

end
