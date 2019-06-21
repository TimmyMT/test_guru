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

User.create([
    {name: 'timmy'},
    {name: 'mentor'},
    {name: 'nobody'}
            ]
)

Category.create([
    {title: 'backend'},
    {title: 'frontend'}
             ]
)

Test.create([
    {level: 2, title: 'Ruby', category_id: Category.find(1).id},
    {level: 3, title: 'Javascript', category_id: Category.find(2)},
    {level: 1, title: 'HTML', category_id: Category.find(2)}
        ]
)

Result.create([
    {user_id: User.find(1), test_id: Test.find(1)},
    {user_id: User.find(1), test_id: Test.find(2)},
    {user_id: User.find(1), test_id: Test.find(3), status: true},
    {user_id: User.find(2), test_id: Test.find(1), status: true},
    {user_id: User.find(2), test_id: Test.find(2), status: true},
    {user_id: User.find(1), test_id: Test.find(3), status: true},
    {user_id: User.find(3), test_id: Test.find(1)},
    {user_id: User.find(3), test_id: Test.find(2)},
    {user_id: User.find(1), test_id: Test.find(2)}
          ]
)

Question.create([
    {body: 'Question 1 for ruby', test_id: Test.find(1)},
    {body: 'Question 2 for ruby', test_id: Test.find(1)},
    {body: 'Question 1 for JS', test_id: Test.find(2)},
    {body: 'Question 2 for JS', test_id: Test.find(2)},
    {body: 'Question for html', test_id: Test.find(3)}
])

Answer.create([
    {body: 'Answer 1 for ruby', test_id: Question.find(1)},
    {body: 'Answer 2 for ruby', test_id: Question.find(1)},
    {body: 'Answer 1 for JS', test_id: Question.find(2)},
    {body: 'Answer 2 for JS', test_id: Question.find(2)},
    {body: 'Answer for html', test_id: Question.find(3)}
])
