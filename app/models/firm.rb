class Firm < ActiveRecord::Base

  validates_uniqueness_of :title
  validates_presence_of :title, :url

  def to_param
    url
  end

end
