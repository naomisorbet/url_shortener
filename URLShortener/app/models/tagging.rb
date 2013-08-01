class Tagging < ActiveRecord::Base
  attr_accessible :category_id, :short_url_id

  belongs_to(
    :category,
    :class_name => "Category",
    :foreign_key => :category_id,
    :primary_key => :id
  )

  belongs_to(
    :short_url,
    :class_name => "ShortUrl",
    :foreign_key => :short_url_id,
    :primary_key => :id
  )
end
