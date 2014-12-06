require 'assert/factory'

module Factory
  extend Assert::Factory

  def self.template_json_rendered(engine, service_handler, locals)
    { 'thing' => {
        'id' => service_handler.identifier,
        'name' => service_handler.name,
        'local1' => locals['local1'],
        'logger' => engine.logger.to_s
      }
    }
  end

end
