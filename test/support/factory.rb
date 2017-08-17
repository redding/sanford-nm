require 'assert/factory'

module Factory
  extend Assert::Factory

  def self.render_template_json_rendered(engine, service_handler, locals)
    { 'thing' => {
        'id'     => service_handler.identifier,
        'name'   => service_handler.name,
        'local1' => locals['local1'],
        'logger' => engine.logger.to_s
      }
    }
  end

  def self.partial_template_json_rendered(engine, locals)
    { 'thing' => {
        'local1' => locals['local1'],
        'logger' => engine.logger.to_s
      }
    }
  end

end
