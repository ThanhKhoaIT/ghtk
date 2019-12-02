module Ghtk
  class Order

    def self.create(serializer)
      create_data = NinjaVan::FlexibleParams.new(serializer).hash
      Ghtk::Validations::OrderValidation.new(create_data).validate!
      Ghtk::Request.post('/services/shipment/order', create_data)
    rescue Ghtk::RequestError => e
      error_code = e.response.dig('error', 'code') || 'REQUEST'
      error_class = "Ghtk::#{error_code.downcase.classify}Error".safe_constantize || Ghtk::RequestError
      raise error_class, e.response
    rescue Ghtk::ForbiddenError
      raise Ghtk::CreateOrderError.new(create_data)
    end

    def self.get_detail(tracking_code)
      raise Ghtk::BadParamsError.new('Tracking code is blank!') if Ghtk.is_blank?(tracking_code)
      Ghtk::Request.get("/services/shipment/v2/#{tracking_code}")
    end

    def self.cancel(tracking_code)
      raise Ghtk::BadParamsError.new('Tracking code is blank!') if Ghtk.is_blank?(tracking_code)
      Ghtk::Request.post("/services/shipment/cancel/#{tracking_code}")
    end

  end
end
