module Ghtk
  class Error < StandardError; end
  class ForbiddenError < Error; end
  class ServerError < Error; end
  class CreateOrderError < Error; end
  class BadParamsError < Error; end

  class RequestError < Error

    attr_reader :response

    def initialize(response)
      @response = response
      super(response['message'])
    end

  end

  class OrderIdExistError < RequestError; end

end
