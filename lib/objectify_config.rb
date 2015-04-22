require "objectify_config/version"
require "yaml"

module ObjectifyConfig

  class << self
    def configuration_files(*files)
      @configurations = files
    end

    def run
      @configurations.flatten.each do |config_file|
        config_klass_name = klass_name_for(config_file)

        temp_class = Class.new do

          singleton_class.class_eval do

            Object.const_set("CONFIG_FILE", config_file)

            def method_missing(key)
              configuration_keys[key.to_sym]
            end


            def configuration_keys
              file_contents = YAML.load_file(CONFIG_FILE)

              file_contents.each_with_object({}) do |(h,k), result| 
                result[h.to_sym] = k 
              end
            end

          end
        end

        Object.const_set(config_klass_name, temp_class)
      end
    end

    def klass_name_for(config_file)
      "#{Pathname.new(config_file).basename.to_s.split('.')[0].camelize}Config"
    end
  end
end

class String 
  def camelize
    self.split('_').map {|w| w.capitalize}.join
  end
end
