require 'assert/factory'

module Factory
  extend Assert::Factory

  def self.template_json_rendered(scope)
    { 'thing' => {
        'id' => scope.identifier,
        'name' => scope.name
      }
    }
  end

end
