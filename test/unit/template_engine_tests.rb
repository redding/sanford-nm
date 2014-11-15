require 'assert'
require 'sanford-nm'

require 'nm/source'
require 'sanford/template_engine'

class Sanford::Nm::TemplateEngine

  class UnitTests < Assert::Context
    desc "Sanford::Nm::TemplateEngine"
    setup do
      @engine = Sanford::Nm::TemplateEngine.new({
        'source_path' => TEST_SUPPORT_PATH
      })
    end
    subject{ @engine }

    should have_imeths :nm_source, :nm_handler_local, :render

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

    should "render nm template files" do
      service_handler = OpenStruct.new({
        :identifier => Factory.integer,
        :name => Factory.string
      })
      locals = { 'local1' => Factory.string }
      exp = Factory.template_json_rendered(service_handler, locals)

      assert_equal exp, subject.render('template.json', service_handler, locals)
    end

  end

end
