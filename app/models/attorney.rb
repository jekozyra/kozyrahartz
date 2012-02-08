class Attorney < ActiveRecord::Base 
  
  has_attached_file :photo, 
                    :styles => { :normal => "150x150>" },
                    :convert_options => { :all => '-strip -colorspace RGB' },
                    :url  => "/attorney_photos/:style/:basename.:extension",
                    :path => "/home/jekozyra/kozyrahartz/shared/attorney_photos/:style/:basename.:extension"


  
  validates_uniqueness_of :name, :email
  validates_presence_of :name, :email
  validates_attachment_size :photo, :less_than => 5.megabytes, :unless => :skip_photo
  validates_attachment_content_type :photo, :content_type => ['image/jpeg', 'image/png', 'image/gif'], :unless => :skip_photo
  
  def to_param
    short_name
  end
  
end
