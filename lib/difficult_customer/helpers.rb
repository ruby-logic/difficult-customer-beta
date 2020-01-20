# Isolating in gem's namespace.
module DifficultCustomer
  Dir.glob(
    File.join(File.dirname(__FILE__), '..', '..', 'app', 'helpers', '*')
  ).each { |f| require f }
end
