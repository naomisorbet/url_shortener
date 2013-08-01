class Category < ActiveRecord::Base
  attr_accessible :subject

  has_many(
    :taggings,
    :class_name => "Tagging",
    :foreign_key => :category_id,
    :primary_key => :id
  )

  has_many(
    :short_urls,
    :through => :taggings,
    :source => :short_url
  )

end


