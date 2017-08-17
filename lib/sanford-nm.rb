require 'nm'
require 'sanford/template_engine'
require "sanford-nm/version"

module Sanford::Nm

  class TemplateEngine < Sanford::TemplateEngine

    DEFAULT_HANDLER_LOCAL = 'view'.freeze
    DEFAULT_LOGGER_LOCAL  = 'logger'.freeze

    def nm_source
      @nm_source ||= Nm::Source.new(self.source_path, {
        :cache  => self.opts['cache'],
        :ext    => self.opts['ext'],
        :locals => { self.nm_logger_local => self.logger }
      })
    end

    def nm_handler_local
      @nm_handler_local ||= (self.opts['handler_local'] || DEFAULT_HANDLER_LOCAL)
    end

    def nm_logger_local
      @nm_logger_local ||= (self.opts['logger_local'] || DEFAULT_LOGGER_LOCAL)
    end

    def render(path, service_handler, locals)
      self.nm_source.render(path, render_locals(service_handler, locals))
    end

    def partial(path, locals)
      self.nm_source.partial(path, locals)
    end

    private

    def render_locals(service_handler, locals)
      { self.nm_handler_local => service_handler }.merge(locals)
    end

  end

end
