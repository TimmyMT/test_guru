# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

Category.destroy_all
Test.destroy_all
User.destroy_all
Result.destroy_all

users = User.create!([
    {name: 'timmy'},
    {name: 'mentor'},
    {name: 'nobody'}
])

categories = Category.create!([
    {title: 'backend'},
    {title: 'frontend'}
])

tests = Test.create!([
    {level: 2, title: 'Ruby', category_id: categories[0].id},
    {level: 3, title: 'Javascript', category_id: categories[1].id},
    {level: 1, title: 'HTML', category_id: categories[1].id}
])

results = Result.create!([
    {user_id: users[0].id, test_id: tests[0].id},
    {user_id: users[0].id, test_id: tests[1].id},
    {user_id: users[0].id, test_id: tests[2].id, status: true},
    {user_id: users[1].id, test_id: tests[0].id, status: true},
    {user_id: users[1].id, test_id: tests[1].id, status: true},
    {user_id: users[1].id, test_id: tests[2].id, status: true},
    {user_id: users[2].id, test_id: tests[0].id},
    {user_id: users[2].id, test_id: tests[1].id},
    {user_id: users[2].id, test_id: tests[2].id}
])

questions = Question.create!([
    {body: 'Question 1 for ruby', test_id: tests[0].id},
    {body: 'Question 2 for ruby', test_id: tests[0].id},
    {body: 'Question 1 for JS', test_id: tests[1].id},
    {body: 'Question 2 for JS', test_id: tests[1].id},
    {body: 'Question for html', test_id: tests[2].id}
])

answers = Answer.create!([
    {body: 'Answer 1 for ruby', question_id: questions[0].id},
    {body: 'Answer 2 for ruby', question_id: questions[0].id},
    {body: 'Answer 1 for JS', question_id: questions[1].id},
    {body: 'Answer 2 for JS', question_id: questions[1].id},
    {body: 'Answer for html', question_id: questions[2].id}
])
