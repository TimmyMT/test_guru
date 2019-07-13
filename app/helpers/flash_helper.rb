module FlashHelper
  def flash_message(type)
    content_tag(:div, flash[:"#{type}"], class: "flash_#{type}")
  end
end
