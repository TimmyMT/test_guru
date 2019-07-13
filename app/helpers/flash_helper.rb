module FlashHelper
  def flash_messages
    flash.each do |value|
      content_tag :p, value, class: 'flash_fail'
    end
  end
end
