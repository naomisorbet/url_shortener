class ShortUrl < ActiveRecord::Base
  attr_accessible :long_url_id, :user_id, :url_code

  belongs_to(
    :long_url,
    :class_name => "LongUrl",
    :foreign_key => :long_url_id,
    :primary_key => :id
  )

  belongs_to(
    :user,
    :class_name => "User",
    :foreign_key => :user_id,
    :primary_key => :id
  )

  has_many(
    :visits,
    :class_name => "Visit",
    :foreign_key => :visitor_id,
    :primary_key => :id
  )

  has_many(
    :comments,
    :class_name => "Comment",
    :foreign_key => :short_url_id,
    :primary_key => :id
  )

  has_many(
    :taggings,
    :class_name => "Tagging",
    :foreign_key => :short_url_id,
    :primary_key => :id
  )

  has_many(
    :categories,
    :through => :taggings,
    :source => :category
  )

  def self.create_short_url(long_url, user_id)
    long_url_id = LongUrl.id_of(long_url)

    ShortUrl.create({
      :long_url_id => long_url_id,
      :user_id => user_id,
      :url_code => ShortUrl.random_code
      })
    # return short url object (incl. url_code, user_id)
    # save short url to table
  end

  def self.random_code
    code = ""
    random_chars = SecureRandom.urlsafe_base64.split("")
    until code.length == 5
      char = random_chars.pop
      code += char if char.match(/\w/)
    end
    code
  end

  def long_url
    LongUrl.find(long_url_id).url
  end

  def visit_count
    visits.count
  end

  def unique_visitor_count
    visits.uniq(&:visitor_id).count
  end

  def recent_visit_count
    visits.select { |visit| visit.created_at > Time.now - 600 }.count
  end

end
