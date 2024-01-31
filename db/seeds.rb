# This file should ensure the existence of records required to run the application in every environment (production,
# development, test). The code here should be idempotent so that it can be executed at any point in every environment.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Example:
#
#   ["Action", "Comedy", "Drama", "Horror"].each do |genre_name|
#     MovieGenre.find_or_create_by!(name: genre_name)
#   end

forums = Forum.all
# only run if empty
if forums.length < 2
  # user = User.create(username: 'denvermullets')
  # puts 'user created'
  forum_one = Forum.create(name: 'Music')
  forum_two = Forum.create(name: 'General')
  puts 'forums created'

  sub_forum_one = SubForum.create(name: 'Ambient / Experimental', forum: forum_one)
  sub_forum_two = SubForum.create(name: 'Electronica / IDM', forum: forum_one)
  sub_forum_three = SubForum.create(name: 'Punk / Hardcore / Post Hardcore', forum: forum_one)
  sub_forum_four = SubForum.create(name: 'Post-Rock', forum: forum_one)
  sub_forum_five = SubForum.create(name: 'Hip Hop / Rap', forum: forum_one)
  sub_forum_six = SubForum.create(name: 'Indie / Shoegaze / Rock', forum: forum_one)
  sub_forum_seven = SubForum.create(name: 'Other Music', forum: forum_one)
  sub_forum_eight = SubForum.create(name: 'Self Promotion', forum: forum_one)
  sub_forum_nine = SubForum.create(name: 'Event Discussion', forum: forum_one)

  sub_forum_ten = SubForum.create(name: 'General Discussion', forum: forum_two)
  sub_forum_eleven = SubForum.create(name: 'Real Discussion', forum: forum_two)
  sub_forum_twelve = SubForum.create(name: 'Entertainment', forum: forum_two)
  sub_forum_thirteen = SubForum.create(name: 'Off Topic', forum: forum_two)
  puts 'sub forums created'

  # topic_one = Topic.create(title: 'This is Topic 1', body: 'This is a topic body', forum: forum_one, user:, sub_forum: sub_forum_one)
  # topic_two = Topic.create(title: 'This is Topic 2', body: 'This is a topic body', forum: forum_one, user:, sub_forum: sub_forum_two)
  # topic_three = Topic.create(title: 'This is Topic 3', body: 'This is a topic body', forum: forum_one, user:, sub_forum: sub_forum_three)
  # topic_four = Topic.create(title: 'This is Topic 4', body: 'This is a topic body', forum: forum_one, user:, sub_forum: sub_forum_four)
  # topic_five = Topic.create(title: 'This is Topic 5', body: 'This is a topic body', forum: forum_one, user:, sub_forum: sub_forum_five)
  # topic_six = Topic.create(title: 'This is Topic 6', body: 'This is a topic body', forum: forum_one, user:, sub_forum: sub_forum_six)
  # topic_seven = Topic.create(title: 'This is Topic 7', body: 'This is a topic body', forum: forum_one, user:, sub_forum: sub_forum_seven)
  # topic_eight = Topic.create(title: 'This is Topic 8', body: 'This is a topic body', forum: forum_one, user:, sub_forum: sub_forum_eight)
  # topic_nine = Topic.create(title: 'This is Topic 9', body: 'This is a topic body', forum: forum_one, user:, sub_forum: sub_forum_nine)
  # topic_ten = Topic.create(title: 'This is Topic 10', body: 'This is a topic body', forum: forum_two, user:, sub_forum: sub_forum_ten)

  # topic_eleven = Topic.create(title: 'This is Topic 11', body: 'This is a topic body', forum: forum_two, user:, sub_forum: sub_forum_eleven)
  # topic_twelve = Topic.create(title: 'This is Topic 12', body: 'This is a topic body', forum: forum_two, user:, sub_forum: sub_forum_twelve)
  # topic_thirteen = Topic.create(title: 'This is Topic 13', body: 'This is a topic body', forum: forum_two, user:, sub_forum: sub_forum_thirteen)
  # puts 'topics created'

  # Comment.create(body: 'this is a comment body 1', topic: topic_one, user:)
  # Comment.create(body: 'this is a comment body 2', topic: topic_one, user:)
  # Comment.create(body: 'this is a comment body 3', topic: topic_one, user:)
  # Comment.create(body: 'this is a comment body 4', topic: topic_one, user:)
  # Comment.create(body: 'this is a comment body 5', topic: topic_one, user:)
  # Comment.create(body: 'this is a comment body 6', topic: topic_one, user:)
  # Comment.create(body: 'this is a comment body 7', topic: topic_one, user:)
  # Comment.create(body: 'this is a comment body 8', topic: topic_one, user:)
  # Comment.create(body: 'this is a comment body 9', topic: topic_one, user:)
  # Comment.create(body: 'this is a comment body 10', topic: topic_one, user:)

  puts 'done'
end