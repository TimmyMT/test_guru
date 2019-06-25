Category.destroy_all
Test.destroy_all
User.destroy_all
Question.destroy_all
Answer.destroy_all

User.create!([
  {name: 'timmy'},
  {name: 'mentor'},
  {name: 'nobody'}
])

Category.create!([
  {title: 'backend'},
  {title: 'frontend'}
])
