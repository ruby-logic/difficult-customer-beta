# Gem's configuration
module DifficultCustomer
  # Configuration class
  class Config

    def config
      YAML.load_file(config_file).freeze
    end

    private

    def config_path
      File.join(Dir.pwd, 'config/difficult_customer.yml')
    end

    def config_file
      return config_path if File.exist?(config_path)

      File.join(
        File.dirname(__FILE__),
        '..',
        '..',
        'example',
        'difficult_customer.yml'
      )
    end
  end
end
