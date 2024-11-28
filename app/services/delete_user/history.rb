# asdf

module DeleteUser
  class History < Service
    def initialize(user_id:)
      @user = User.find(user_id)
    end

    def call
      delete_topic_receipts
      delete_comments
      delete_topic
      delete_user
    end

    private

    def delete_topic_receipts
      UserTopicReceipt.where(user_id: @user.id).each(&:delete)
    end

    def delete_comments
      Comment.where(user_id: @user.id).each(&:delete)
    end

    def delete_topic
      topics = Topic.where(user_id: @user.id)
      topics.each { |topic| topic.comments.count.positive? ? delete_other_comments(topic) : topic.delete }
    end

    def delete_other_comments(topic)
      topic.comments.each(&:delete)
    end

    def delete_user
      @user.delete
    end
  end
end
