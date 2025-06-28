module ConstrainedForm
  class FormBuilder < ActionView::Helpers::FormBuilder
    def field(data:, **, &)
      data = Hash(data).tap do |hash|
        hash[:controller] = token_list(hash[:controller], "constrained-form--field")
      end

      tag.div data: data, **, &
    end
  end
end