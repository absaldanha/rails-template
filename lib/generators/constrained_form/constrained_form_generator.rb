class ConstrainedFormGenerator < Rails::Generators::Base
  source_root File.expand_path("templates", __dir__)

  def create_form_builder
    template "lib/constrained_form/form_builder.rb"
  end
end
