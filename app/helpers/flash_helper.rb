module FlashHelper
  def flash_alert
    if flash[:alert]
      content_tag :p, flash[:alert], class: 'flash_fail'
    end
  end
end
