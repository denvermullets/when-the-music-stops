class SubForum < ApplicationRecord
  belongs_to :forum

  has_many :topics

  validates :slug, uniqueness: true

  before_save :generate_slug

  def to_param
    slug
  end

  def unread_posts?(user)
    # if stuff gets sluggish we should dip into caching here
    return false unless user

    # get the IDs of topics that the user has read receipts for in this sub-forum
    read_topic_ids = UserTopicReceipt.where(user:, topic_id: topics.select(:id)).pluck(:topic_id)

    # check for topics that have recent activity after the last_read_time
    last_read_time = UserTopicReceipt.where(user:, topic_id: read_topic_ids).maximum(:last_read)
    updated_topics_exist = topics.where('id IN (?) AND recent_activity > ?', read_topic_ids, last_read_time).exists?

    # check for new topics that the user has no read receipts for
    new_topics_exist = topics.where.not(id: read_topic_ids).exists?

    updated_topics_exist || new_topics_exist
  end

  private

  def generate_slug
    self.slug = name.parameterize
  end
end
