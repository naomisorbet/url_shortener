class Visit < ActiveRecord::Base
  # attr_accessible
  belongs_to(
    :short_url,
    :class_name => "ShortUrl",
    :foreign_key => :short_url_id,
    :primary_key => :id
  )
  belongs_to(
    :visitor,
    :class_name => "User",
    :foreign_key => :visitor_id,
    :primary_key => :id
  )
end
