# Rails helper
module DifficultCustomerHelper
  def difficult_customer
    session[:requests] = session[:requests].to_i + 1
    render_partials
  end

  def random_dom_ids(count, complexity: 10)
    Array.new(count) { random_string(complexity) }
  end

  private

  def render_partials
    [render_every_request, render_after_sign_in, render_every_n_requests]
      .reduce(:concat).map { |msg| render_message msg }.first
  end

  def render_message(message)
    return if message.nil?

    render "difficult_customer/#{message['appearance']}",
           message: message_params(message, message['priority'])
  end

  def difficult_customer_options
    DifficultCustomer::Config.new.config
  end

  def messages
    difficult_customer_options['messages']
  end

  def message_params(message, priority)
    case priority
    when 'low' then default_low_params
    when 'medium' then default_medium_params
    when 'high' then default_high_params
    end.merge(message)
  end

  def default_low_params
    {
      appearance: 'banner',
      position: 'bottom',
      colour: 'yellow',
      text: "I had something to say but I've forgotten what it'd be",
      frequency: nil,
      start_date: nil,
      end_date: nil
    }
  end

  def default_medium_params
    {
      appearance: 'alert',
      position: 'nil',
      colour: 'orange',
      text: "I had something to say but I've forgotten what it'd be",
      frequency: nil,
      start_date: nil,
      end_date: nil
    }
  end

  def default_high_params
    {
      appearance: 'page',
      colour: 'red',
      text: "I had an very important job to do...
      But I've totally forgotten what it was!",
      frequency: nil,
      start_date: nil,
      end_date: nil
    }
  end

  def render_every_request
    with_attribute('frequency', 'every-request')
  end

  def render_after_sign_in
    if session[:dc_signin_seen] != true && user_signed_in?
      session[:dc_signin_seen] = true
      with_attribute('frequency', 'after-sign-in')
    end || []
  end

  def render_every_n_requests
    out = []
    messages.each do |message|
      if message['message']['frequency'] =~ /every-(\d+)-requests/
        out.push(message['message']) if frequency_matched?(message)
      end
    end
    out
  end

  def frequency_n_requests(message)
    message['message']['frequency'].split('-')[1].to_i
  end

  def frequency_matched?(message)
    (session[:requests] % frequency_n_requests(message)).zero?
  end

  def with_attribute(key, value)
    out = []
    messages.each do |message|
      out.push(message['message']) if message['message'][key] == value
    end
    out
  end

  def random_string(complexity)
    Array.new(complexity) { ('a'..'z').to_a.sample }.join
  end
end

ActionView::Base.send :include, DifficultCustomerHelper
