# frozen_string_literal: true

namespace :app do
  # Checks and ensures task is not run in production.
  task ensure_development_environment: :environment do
    raise "\nI'm sorry, I can't do that.\n(You're asking me to drop your production database.)" if Rails.env.production?
  end

  # Custom install for developement environment
  desc 'Install'
  task install: [:ensure_development_environment, 'db:migrate', 'db:test:prepare', 'db:seed', 'app:populate',
                 'spec']

  # Custom reset for developement environment
  desc 'Reset'
  task reset: [:ensure_development_environment, 'db:drop', 'db:create', 'db:migrate', 'db:test:prepare',
               'db:seed', 'app:populate']

  # Populates development data
  desc 'Populate the database with development data.'
  task populate: :environment do
    puts "#{'*' * `tput cols`.to_i}\nChecking Environment... The database will be cleared of all content before populating.\n#{'*' * `tput cols`.to_i}"
    # Removes content before populating with data to avoid duplication
    Rake::Task['db:reset'].invoke

    # INSERT BELOW

    [
      {
        name: 'Nokia 8.3',
        price: 500,
        quantity: 20,
        image_url: 'https://images.unsplash.com/photo-1586329501141-c0a435d6c0bb?ixid=MXwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHw%3D&ixlib=rb-1.2.1&auto=format&fit=crop&w=1950&q=80'
      },
      {
        name: 'samsung s21',
        price: 800,
        quantity: 20,
        image_url: 'https://images.unsplash.com/photo-1541096088083-65e23ee14e43?ixid=MXwxMjA3fDB8MHxzZWFyY2h8MTJ8fHBob25lc3xlbnwwfHwwfA%3D%3D&ixlib=rb-1.2.1&auto=format&fit=crop&w=500&q=60'
      },
      {
        name: 'Mac book',
        price: 1000,
        quantity: 20,
        image_url: 'https://images.unsplash.com/photo-1477327070293-75f15e291bb0?ixid=MXwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHw%3D&ixlib=rb-1.2.1&auto=format&fit=crop&w=1350&q=80" alt="Card image cap'
      },
      {
        name: 'Ipad',
        price: 1000,
        quantity: 20,
        image_url: 'https://images.unsplash.com/photo-1546868871-0f936769675e?ixid=MXwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHw%3D&ixlib=rb-1.2.1&auto=format&fit=crop&w=700&q=80'
      },
      {
        name: 'Dell Laptop',
        price: 1000,
        quantity: 20,
        image_url: 'https://images.unsplash.com/photo-1593642634315-48f5414c3ad9?ixid=MXwxMjA3fDB8MHxzZWFyY2h8M3x8ZGVsbCUyMGxhcHRvcHxlbnwwfHwwfA%3D%3D&ixlib=rb-1.2.1&auto=format&fit=crop&w=500&q=60'
      }
    ].each do |attributes|
      Product.create(attributes)
    end

    # INSERT ABOVE

    puts "#{'*' * `tput cols`.to_i}\nThe database has been populated!\n#{'*' * `tput cols`.to_i}"
  end
end
