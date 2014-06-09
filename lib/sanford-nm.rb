require 'nm'
require 'sanford/template_engine'
require "sanford-nm/version"

module Sanford::Nm

  class TemplateEngine < Sanford::TemplateEngine

    DEFAULT_SCOPE_NAME = 'view'

    def nm_source
      @nm_source ||= Nm::Source.new(self.source_path)
    end

    def nm_scope_name
      @nm_scope_name ||= (self.opts['scope_name'] || DEFAULT_SCOPE_NAME)
    end

    def render(path, scope)
      self.nm_source.render(path, self.nm_scope_name => scope)
    end

  end

end
