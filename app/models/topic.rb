class Topic < ApplicationRecord
  belongs_to :forum
  belongs_to :user
  belongs_to :sub_forum
  has_many :comments
  has_many :user_topic_receipts

  validates :slug, uniqueness: true
  validates :title, uniqueness: { case_sensitive: false }

  before_save :generate_slug

  def to_param
    slug
  end

  def read?(user)
    # determines if the topic has been read by the current user
    return false unless user

    receipt = user_topic_receipts.where(user:)&.first
    return false unless receipt

    recent_activity < receipt.last_read
  end

  private

  def generate_slug
    self.slug = title.parameterize
  end
end
