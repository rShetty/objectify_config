require "objectify_config/version"

module ObjectifyConfig

  def self.configuration_files(*files)
    @configurations = files
  end

  def self.run
    @configurations.flatten.each do |config_file|
    eval <<EOS
    class ::#{config_file.split('.')[0].camelize}Config

      def self.method_missing(key)
        configurations[key.to_sym]
      end

      private

      def self.configurations
        YAML.load_file("#{Rails.root}/config/#{config_file}")[Rails.env].symbolize_keys!
      end
    end
EOS
    end
  end

end
