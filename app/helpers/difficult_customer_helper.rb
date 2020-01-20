# Rails helper
module DifficultCustomerHelper
  def difficult_customer
    session[:requests] = session[:requests].to_i + 1
    msg = DifficultCustomer::MessageDisplay.new(
      session,
      request,
      user_signed_in?
    ).message_to_render
    return if msg.nil?

    render "difficult_customer/#{msg.params['appearance']}", message: msg
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
