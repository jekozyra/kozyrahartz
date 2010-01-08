class Attorney < ActiveRecord::Base
  
  has_attached_file :photo, 
                    :styles => { :normal => "150x150>" },
                    :convert_options => { :all => '-strip -colorspace RGB' },
                    :url  => "/attorney_photos/:style/:basename.:extension",
                    :path => ":rails_root/public/attorney_photos/:style/:basename.:extension"


  
  validates_uniqueness_of :name, :email
  validates_presence_of :name, :email
  validates_attachment_size :photo, :less_than => 5.megabytes
  validates_attachment_content_type :photo, :content_type => ['image/jpeg', 'image/png', 'image/gif']
  
  def to_param
    short_name
  end
  
end
