module DifficultCustomer
  module Generators
    # This generator copies example config into config/.
    class InstallGenerator < Rails::Generators::Base

      source_root File.expand_path('../../../example', __dir__)

      def copy_config
        template 'difficult_customer.yml', 'config/difficult_customer.yml'
      end

    end
  end
end
