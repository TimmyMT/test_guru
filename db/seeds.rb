# Category.destroy_all
# Test.destroy_all
# User.destroy_all
# Question.destroy_all
# Answer.destroy_all

# User.create!([
#   {name: 'timmy'},
#   {name: 'mentor'},
#   {name: 'nobody'}
# ])
#
# Category.create!([
#   {title: 'backend'},
#   {title: 'frontend'}
# ])
#
# Category.first.tests.create(title: 'Ruby', creator_id: User.find_by(name: 'mentor').id)
# Category.last.tests.create(title: 'JavaScript', creator_id: User.find_by(name: 'mentor').id)
# Category.last.tests.create(title: 'Html', creator_id: User.find_by(name: 'timmy').id)
#
# Test.find_by(title: 'Ruby').questions.create(body: 'Question 1 for Ruby')
# Test.find_by(title: 'Ruby').questions.create(body: 'Question 2 for Ruby')
# Test.find_by(title: 'JavaScript').questions.create(body: 'Question 1 for JS')
# Test.find_by(title: 'JavaScript').questions.create(body: 'Question 2 for JS')
# Test.find_by(title: 'Html').questions.create(body: 'Question for html')
#
# Question.find_by(body: 'Question 1 for Ruby').answers.create(body: 'Answer 1 for Ruby')
# Question.find_by(body: 'Question 2 for Ruby').answers.create(body: 'Answer 2 for Ruby')
# Question.find_by(body: 'Question 1 for JS').answers.create(body: 'Answer 1 for JS')
# Question.find_by(body: 'Question 2 for JS').answers.create(body: 'Answer 2 for JS')
# Question.find_by(body: 'Question for html').answers.create(body: 'Answer for html')