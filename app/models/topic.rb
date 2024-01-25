class Topic < ApplicationRecord
  belongs_to :forum
  belongs_to :user
  belongs_to :sub_forum
  has_many :comments

  validates :slug, uniqueness: true
  validates :title, uniqueness: { case_sensitive: false }

  before_save :generate_slug

  def to_param
    slug
  end

  private

  def generate_slug
    self.slug = title.parameterize
  end
end
