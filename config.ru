require './config/environment'

begin
  fi_check_migration

  use Rack::MethodOverride
  #PATCH and DELETE method thingie
  run ApplicationController
  #Main controller
  use CharacterController
  use NovelController
  use UsersController
  use SessionsController
  #Auxiliary controllers

rescue ActiveRecord::PendingMigrationError => err
  STDERR.puts err
  exit 1
end
