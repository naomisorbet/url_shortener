class Comment < ActiveRecord::Base
  attr_accessible :short_url_id, :author_id, :body

  belongs_to(
    :short_url,
    :class_name => "ShortUrl",
    :foreign_key => :short_url_id,
    :primary_key => :id
  )

  belongs_to(
    :author,
    :class_name => "User",
    :foreign_key => :author_id,
    :primary_key => :id
  )

end
