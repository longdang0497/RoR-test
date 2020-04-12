RailsAdmin.config do |config|
  ## == Devise ==
  config.authenticate_with do
    warden.authenticate! scope: :admin
  end
  config.current_user_method(&:current_admin)

  config.excluded_models = ["Favorite"]
  config.actions do
    dashboard                     # mandatory
    index                         # mandatory
    new do
      except ["User", "Booking"]
    end
    export
    bulk_delete
    show
    edit do
      except ["Booking"]
    end
    delete 
    show_in_app

    ## With an audit adapter, you can add:
    # history_index
    # history_show
  end
end
