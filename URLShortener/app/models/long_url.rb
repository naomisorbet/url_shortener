class LongUrl < ActiveRecord::Base
  attr_accessible :url

  has_many(
    :short_urls,
    :class_name => "ShortUrl",
    :primary_key => :id,
    :foreign_key => :long_url_id
  )

  def self.id_of(url)

    results = LongUrl.where("url = :url", :url => url) # returns an array of LongUrl objects

    if results.empty?
      l = LongUrl.create( :url => url)
      l.id
    else
      results.first.id
    end

  end


end
