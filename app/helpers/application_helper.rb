module ApplicationHelper
  def convert_http_code(code)
    case code.to_i
      when 200..299 then :success
      when 300..399 then :info
      when 400..499 then :warning
      when 500..599 then :danger
      else :dark
    end
  end
end
