Kaminari.configure do |config|
# default_per_page      # 25 by default
# max_per_page          # nil by default
# max_pages             # nil by default
# window                # 4 by default
# outer_window          # 0 by default
# left                  # 0 by default
# right                 # 0 by default
# page_method_name      # :page by default
# param_name            # :page by default
# params_on_first_page  # false by default

    config.default_per_page = 20
    config.max_per_page = 200

end