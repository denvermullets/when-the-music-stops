class Forum < ApplicationRecord
  has_many :sub_forums

  validates :slug, uniqueness: true

  before_save :generate_slug

  def to_param
    slug
  end

  private

  def generate_slug
    self.slug = name.parameterize
  end
end
