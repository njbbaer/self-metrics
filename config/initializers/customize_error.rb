# frozen_string_literal: true

# Disable form helper field_with_errors wrapper
ActionView::Base.field_error_proc = proc do |html_tag, _|
  html_tag.html_safe
end
