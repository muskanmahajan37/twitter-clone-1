class CreateUserNameAndEmailIndex < ActiveRecord::Migration
  def change
    execute "
    create index on users using gin(to_tsvector('english', name));
    create index on users using gin(to_tsvector('english', email));"
  end
end
