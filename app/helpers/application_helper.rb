module ApplicationHelper
  def no_login?
    current_page?(controller: 'sessions', action: 'new') ||
    current_page?(controller: 'users', action: 'new')
  end

  def auth_token
    <<-HTML.html_safe
      <input type="hidden" name="authenticity_token"
      value="#{form_authenticity_token}">
    HTML
  end
end
