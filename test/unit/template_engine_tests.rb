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

    should have_imeths :nm_source, :nm_scope_name

    should "be a Sanford template engine" do
      assert_kind_of Sanford::TemplateEngine, subject
      assert_respond_to 'render', subject
    end

    should "memoize its Nm source" do
      assert_kind_of Nm::Source, subject.nm_source
      assert_equal subject.source_path, subject.nm_source.root
      assert_same subject.nm_source, subject.nm_source
    end

    should "use 'view' as the scope name by default" do
      assert_equal 'view', subject.nm_scope_name
    end

    should "allow custom scope names" do
      scope_name = Factory.string
      engine = Sanford::Nm::TemplateEngine.new('scope_name' => scope_name)
      assert_equal scope_name, engine.nm_scope_name
    end

    should "render nm template files" do
      thing = OpenStruct.new(:identifier => Factory.integer, :name => Factory.string)
      exp = Factory.template_json_rendered(thing)

      assert_equal exp, subject.render('template.json', thing)
    end

  end

end
