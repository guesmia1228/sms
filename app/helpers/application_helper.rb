module ApplicationHelper

  def error_message(object, attr)
    object.errors.full_messages_for(attr).reduce(''.html_safe) do |error, message|
      error << content_tag(:div, message, class: 'message-error')
    end
  end

end
