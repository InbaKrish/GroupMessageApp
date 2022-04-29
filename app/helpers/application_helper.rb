module ApplicationHelper
  def get_uniq_pic_id
    return rand(1..5) if session[:prof_pic].blank?
    loop do
      number = rand(1..5)
      break number unless session[:prof_pic] == number
    end
  end
  def format_message(text)
    Kramdown::Document.new(text).to_html
  end
end
