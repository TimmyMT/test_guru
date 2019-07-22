module FlashHelper
  # def flash_message(type)
  #   content_tag(:div, flash[type], class: "flash #{type}") if flash.present?
  # end

  def flash_convert(type)
    case type.to_s
    when 'notice' then 'alert alert-info'
    when 'alert' then 'alert alert-danger'
    when 'success' then 'alert alert-success'
    when 'warning' then 'alert alert-danger'
    end
  end
end
