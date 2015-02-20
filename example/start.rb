require "recommender"
require "highline/import"

File.readlines('./sample.txt').each do |line|
  user_id, product_id = line.chomp.split(';')
  ::Recommender::UserManager.find_or_create_user(user_id).add_product(product_id)
end

LINE_LENGTH = 80

ft = HighLine::ColorScheme.new do |cs|
  cs[:headline]         = [ :bold, :yellow, :on_black ]
  cs[:horizontal_line]  = [ :bold, :white, :on_blue]
  cs[:question]         = [ :blue ]
  cs[:answer]           = [ :green ]
  cs[:wrong_answer]     = [ :red ]
end

HighLine.color_scheme = ft

say "<%= color('Loaded the data from sample.txt!', :headline) %>"

say "<%= color('Enter an id of the user to get the recommendation or quit', :headline) %>"

say "<%= color('-' * LINE_LENGTH, :horizontal_line) %>"

loop do
  choose do |menu|
    menu.layout = :menu_only

    menu.shell = true

    menu.choice(:user, "Recommendations for User.") do |command, details|
      sanitized_details = details.lstrip
      if sanitized_details.empty?
        say "User id is required ..."
      else
        user_ids = sanitized_details.split('')
        user_ids.each do |user_id|
          next if user_id.to_i == 0
          recommendations = ::Recommender::UserManager.recommendations_for(user_id)

          if recommendations.empty?
            say "Cannot find any recommendation for User #{user_id}"
          else
            say "Recommendation for User #{user_id} is #{recommendations.join(', ')}"
          end
        end
      end
    end

    menu.choice(:quit, "Exit program.") { exit }
  end
  say "<%= color('-' * LINE_LENGTH, :horizontal_line) %>"
end

