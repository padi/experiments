# rubocop:disable all
#
# Example of begin-rescue-ensure-clause with retry
class CustomError < StandardError; end

retries = 3
begin
  raise CustomError, 'custom message'
rescue CustomError => e
  retries -= 1
  puts "rescue CustomError: #{retries}"
  raise "end" if retries <= 0 # ~> RuntimeError: end
  retry
ensure
  puts "ensure: #{retries}"
end

# >> rescue CustomError: 2
# >> rescue CustomError: 1
# >> rescue CustomError: 0
# >> ensure: 0

# ~> RuntimeError
# ~> end
# ~>
# ~> /var/folders/7b/s1sfl3bx0jv4cv13wk3q834800010l/T/seeing_is_believing_temp_dir20170626-31138-kosgp9/program.rb:9:in `rescue in <main>'
# ~> /var/folders/7b/s1sfl3bx0jv4cv13wk3q834800010l/T/seeing_is_believing_temp_dir20170626-31138-kosgp9/program.rb:13:in `<main>'

