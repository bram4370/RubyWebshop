class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  current_time = Time.now
  @date = current_time.strftime "%Y/%m/%d"
  @time = current_time.strftime "%H:%M"
end
