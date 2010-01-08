class NewsEntry < ActiveRecord::Base
  
  def date_string
    self.date.strftime("%B") + " " + self.date.mday.to_s + ", " + self.date.strftime("%Y")
  end
  
end
