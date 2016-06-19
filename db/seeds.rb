User.create!(first_name:  "Example User",
            last_name: "Example Userman",
             email: "example@railstutorial.org",
             password:              "foobar15",
             password_confirmation: "foobar15",
             phone: "444-444-5555",
             address: "123 nowhere ave",
             zip_code: "99999",
             city: "Springfield",
             state: "Unknown",
             career: "Something",
             experience: "5 years",
             years_at_job: "3 years",
             bio: "I have a job of some sort.",
             admin: true)

99.times do |n|
  name  = Faker::Name.name
  email = "example-#{n+1}@railstutorial.org"
  password = "password15"
  User.create!(first_name:  name,
              last_name: name,
               email: email,
               password:              password,
               password_confirmation: password,
               phone: "444-444-5555",
               address: "123 nowhere ave",
               zip_code: "99999",
               city: "Springfield",
               state: "Unknown",
               career: "Something",
               experience: "5 years",
               years_at_job: "3 years",
               bio: "I have a job of some sort.")
end