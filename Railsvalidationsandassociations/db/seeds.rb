# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)
User.destroy_all
AnswerChoice.destroy_all
Poll.destroy_all
Question.destroy_all
Response.destroy_all



["bobjackson","jeffgordon","sarajohnson","joanofarc","starcitizen"].each do |name|
  User.create!(user_name: name)
end

[["Animals",User.first.id],["Buildings",User.last.id],["Sports",User.last.id]].each do |(title, author_id)|
  Poll.create!(title: title, author_id: author_id)
end

[["What is your favorite animal?", Poll.first.id],["What building do you like most?", Poll.all[1].id],["What is your favorite sport?", Poll.last.id]].each do |(question, poll_id)|
  Question.create!(question_body: question, poll_id: poll_id )
end

AnswerChoice.create!([{question_id: Question.all[0].id, answer_body: "Elephant"}, {question_id: Question.all[1].id, answer_body: "Empire State"}, {question_id: Question.all[2].id, answer_body: "Rock Climbing"}])
AnswerChoice.create!({question_id: Question.first.id, answer_body: "Double Elephant"})
AnswerChoice.create!({question_id: Question.first.id, answer_body: "Triple Elephant"})

Response.create!([{user_id: User.all[1].id, answer_id: AnswerChoice.all[0].id}, {user_id: User.all[1].id, answer_id: AnswerChoice.all[1].id}, {user_id: User.all[1].id, answer_id: AnswerChoice.all[2].id}])
Response.create!({user_id: User.all[2].id, answer_id: AnswerChoice.find(4).id})
Response.create!({user_id: User.all[3].id, answer_id: AnswerChoice.find(5).id})

# Question.create!(question_body: "Huh?", poll_id: 2)
# AnswerChoice.create!({question_id: 4, answer_body: "Whoo!"})
