Sequel::Model.plugin(:schema)
Sequel::Model.raise_on_save_failure = false # Do not throw exceptions on failure
Sequel::Model.db = case Padrino.env
when :development then Sequel.connect(ENV['DATABASE_URL'] || "postgres://localhost/rokkincrm_development", :loggers => [logger])
when :production  then Sequel.connect(ENV['DATABASE_URL'],  :loggers => [logger])
  when :test        then Sequel.connect("postgres://localhost/rokkincrm_test",        :loggers => [logger])
end
Sequel::Model.db.extension :pg_array
