# Isolating Message in the gem's namespace.
module DifficultCustomer
  # Message model
  class Message

    attr_reader :params

    def initialize(params)
      @params = merge_params(params)
    end

    private

    def merge_params(params)
      DifficultCustomer::Defaults.new.send(params['priority']).merge(params)
    end

  end
end
