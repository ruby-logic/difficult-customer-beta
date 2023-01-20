# Rails helper
module DifficultCustomerHelper
  def difficult_customer(config: DifficultCustomer::Config.new.config)
    session[:requests] = session[:requests].to_i + 1
    msg = DifficultCustomer::MessageDisplay.new(
      session,
      request,
      user_signed_in?,
      config
    ).message_to_render
    return if msg.nil?

    render "difficult_customer/#{msg.params['appearance']}", message: msg, config: config
  end

  def random_dom_ids(count, complexity: 10)
    Array.new(count) { random_string(complexity) }
  end

  private

  def random_string(complexity)
    Array.new(complexity) { ('a'..'z').to_a.sample }.join
  end
end

ActionView::Base.send :include, DifficultCustomerHelper
