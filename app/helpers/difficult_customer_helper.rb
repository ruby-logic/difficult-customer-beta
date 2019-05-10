# Rails helper
module DifficultCustomerHelper
  def difficult_customer
    render "difficult_customer/#{%w[alert modal page].sample}",
           options: difficult_customer_options
    # partials_to_render
  end

  def fake_classes_array(array_length, string_length: 8)
    Array.new(array_length) { fake_class(string_length: string_length) }
  end

  private

  def difficult_customer_options
    DifficultCustomer::Config.new.config
  end

  def fake_class(string_length: 8)
    ''.tap { |s| string_length.times { s << ('a'..'z').to_a.sample } }
  end
end

ActionView::Base.send :include, DifficultCustomerHelper
