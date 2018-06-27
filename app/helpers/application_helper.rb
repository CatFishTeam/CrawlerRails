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

  def score_http_code(code)
    case code.to_i
    when 200..299 then 3
    when 300..399 then 2
    when 400..499 then 1
    when 500..599 then 0
    end
  end

  def flash_class(level)
    case level
    when 'notice' then "alert alert-dismissable alert-info"
    when 'success' then "alert alert-dismissable alert-success"
    when 'error' then "alert alert-dismissable alert-danger"
    when 'alert' then "alert alert-dismissable alert-danger"
    end
  end
end
