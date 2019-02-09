# frozen_string_literal: true

module ApplicationHelper
  def active?(path)
    if current_page?(path)
      'nav-link active'
    else 
    'nav-link'
    end
  end
end
