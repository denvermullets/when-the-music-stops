class SubForum < ApplicationRecord
  belongs_to :forum

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
