require 'assert'
require 'sanford-nm'

require 'nm/source'
require 'sanford/template_engine'

class Sanford::Nm::TemplateEngine

  class UnitTests < Assert::Context
    desc "Sanford::Nm::TemplateEngine"
    setup do
      @engine = Sanford::Nm::TemplateEngine.new({
        'source_path' => TEST_SUPPORT_PATH,
        'ext'         => 'nm'
      })
    end
    subject{ @engine }

    should have_imeths :nm_source, :nm_handler_local, :nm_logger_local
    should have_imeths :render

    should "be a Sanford template engine" do
      assert_kind_of Sanford::TemplateEngine, subject
    end

    should "memoize its Nm source" do
      assert_kind_of Nm::Source, subject.nm_source
      assert_equal subject.source_path, subject.nm_source.root
      assert_same subject.nm_source, subject.nm_source
    end

    should "use 'view' as the handler local name by default" do
      assert_equal 'view', subject.nm_handler_local
    end

    should "allow custom handler local names" do
      handler_local = Factory.string
      engine = Sanford::Nm::TemplateEngine.new('handler_local' => handler_local)
      assert_equal handler_local, engine.nm_handler_local
    end

    should "pass any given cache option to the Nm source" do
      engine = Sanford::Nm::TemplateEngine.new('cache' => true)
      assert_kind_of Hash, engine.nm_source.cache
    end

    should "pass any given ext option to the Nm source" do
      ext = Factory.string
      engine = Sanford::Nm::TemplateEngine.new('ext' => ext)
      assert_equal ".#{ext}", engine.nm_source.ext
    end

    should "use 'logger' as the logger local name by default" do
      assert_equal 'logger', subject.nm_logger_local
    end

    should "allow custom logger local names" do
      logger_local = Factory.string
      engine = Sanford::Nm::TemplateEngine.new('logger_local' => logger_local)
      assert_equal logger_local, engine.nm_logger_local
    end

    should "render nm template files" do
      service_handler = OpenStruct.new({
        :identifier => Factory.integer,
        :name       => Factory.string
      })
      locals = { 'local1' => Factory.string }
      exp = Factory.template_json_rendered(subject, service_handler, locals)
      assert_equal exp, subject.render('template.json', service_handler, locals)
    end

  end

end
