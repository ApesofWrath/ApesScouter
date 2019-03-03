namespace :db do
    desc "Run migrations"
    task :migrate, [:version] do |t, args|
        require "sequel/core"
        Sequel.extension :migration
        version = args[:version].to_i if args[:version]
    end
end
