Fabricator(:user) do
  email        { sequence(:email) { |i| "user#{i}@example.net" } }
  password     'secret'
  name         'David Heinemeier Hansson'
  nickname     'dhh'
  github_token 'a9ed89dfd15fb3eb5141a2ca183f867c'
end
