# Isolating MessageDisplay in the gem's namespace.
module DifficultCustomer
  # Message renderer
  class MessageDisplay

    def initialize(session, request, user_signed_in)
      @session = session
      @request = request
      @user_signed_in = user_signed_in
    end

    def message_to_render
      return if priorities_sorted.first.nil?

      priorities_sorted.first
    end

    private

    def priorities_sorted
      out = []
      %w[high medium low].each do |priority|
        config['messages'].each do |message|
          message = cast_message(message)
          next unless message.params['priority'] == priority

          out.push(message) if message_qualifies(message)
        end
      end
      out
    end

    def message_qualifies(message)
      return false unless date_in_range(message)

      every_request_qualifies(message) || after_sign_in_qualifies(message) ||
        every_n_requests_qualifies(message)
    end

    def date_in_range(message)
      start_date = message.params['start_date'] || '1970-01-01'
      end_date = message.params['end_date'] || '2100-01-01'
      (Date.parse(start_date)..Date.parse(end_date)).cover?(Time.zone.now)
    end

    def every_request_qualifies(message)
      message.params['frequency'] == 'every-request'
    end

    def every_n_requests_qualifies(message)
      frequency = message.params['frequency']
      return false if (frequency =~ /every-(\d+)-requests/).nil?

      (@session[:requests] % frequency.split('-')[1].to_i).zero?
    end

    def after_sign_in_qualifies(message)
      return false unless message.params['frequency'] == 'after-sign-in'
      return false if @request.referer.nil?

      @request.referer.ends_with?('sign_in') && @user_signed_in
    end

    def cast_message(message_params)
      Message.new(message_params['message'])
    end

    def config
      DifficultCustomer::Config.new.config
    end

  end
end
