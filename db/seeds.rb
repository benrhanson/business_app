# more populations can be done without conflict by commenting out the sections that have already been seeded.

Team.create(city: "Bothell")

Team.create(city: "Kirkland")

Team.create(city: "Bellevue")

User.create!(first_name:  "Example User",
            last_name: "Example Userman",
            email: "example@railstutorial.org",
            password:              "password",
            password_confirmation: "password",
            phone: "444-444-5555",
            address: "123 nowhere ave",
            zip_code: "99999",
            city: "Springfield",
            state: "Unknown",
            career: "Something",
            experience: "5 years",
            years_at_job: "3 years",
            bio: "I have a job of some sort.",
            admin: true,
            team_id: 1)
             
# NOTE: this seed process can be used to put admins into the website when the time is right

99.times do |n|
  name  = Faker::Name.name
  email = "example-#{n+1}@railstutorial.org"
  password = "password"
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
              bio: "I have a job of some sort.",
              team_id: 1 + rand(3))
end