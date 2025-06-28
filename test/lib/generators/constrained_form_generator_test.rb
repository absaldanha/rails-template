require "test_helper"
require "generators/constrained_form/constrained_form_generator"

class ConstrainedFormGeneratorTest < Rails::Generators::TestCase
  tests ConstrainedFormGenerator
  destination Rails.root.join("tmp/generators")
  setup :prepare_destination

  test "generates files" do
    run_generator

    assert_file "lib/constrained_form/form_builder.rb"
  end
end
