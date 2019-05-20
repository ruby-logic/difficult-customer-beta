# Rails helper
module DifficultCustomerHelper
  def difficult_customer
    # TODO: Because we have no logic yet, we're randomly rendering one of the
    # available partials to demonstrate how they are displayed.
    render "difficult_customer/#{%w[alert modal page].sample}",
           options: difficult_customer_options
    # partials_to_render
  end

  def random_dom_ids(count, complexity: 10)
    Array.new(count) { random_string(complexity) }
  end

  private

  def difficult_customer_options
    DifficultCustomer::Config.new.config
  end

  def random_string(complexity)
    Array.new(complexity) { ('a'..'z').to_a.sample }.join
  end
end

ActionView::Base.send :include, DifficultCustomerHelper
