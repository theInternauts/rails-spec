class Post < ActiveRecord::Base
  attr_accessible :title, :content, :is_published

  scope :recent, order: "created_at DESC", limit: 5

  before_save :titleize_title, :sluggize

  validates_presence_of :title, :content


  private

  def sluggize
    self.slug = title.parameterize
  end

  def titleize_title
    self.title = title.titleize
  end

end