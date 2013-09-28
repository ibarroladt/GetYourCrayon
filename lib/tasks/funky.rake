desc "Drop, Create, Migrate and Seed"
task 'funky' => [ "db:drop", "db:create", "db:migrate", "db:seed" ]
