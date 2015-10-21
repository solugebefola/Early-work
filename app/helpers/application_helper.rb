module ApplicationHelper
  def no_login?
    current_page?(controller: 'sessions', action: 'new') ||
    current_page?(controller: 'users', action: 'new')
  end
end
