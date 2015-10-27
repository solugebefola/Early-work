require_relative '../phase2/controller_base'
require 'active_support'
require 'active_support/core_ext'
require 'active_support/inflector'
require 'erb'

module Phase3
  class ControllerBase < Phase2::ControllerBase
    # use ERB and binding to evaluate templates
    # pass the rendered html to render_content
    def render(template_name)
      controller_name = self.class.to_s.underscore
      path_name = "views/#{controller_name}/#{template_name}.html.erb"
      a = File.read(path_name)
      template = ERB.new(a)
      interpreted_template = template.result(binding)
      render_content(interpreted_template, "text/html")
    end
  end
end
