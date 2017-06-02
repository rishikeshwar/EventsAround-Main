OmniAuth.config.logger = Rails.logger

Rails.application.config.middleware.use OmniAuth::Builder do
  provider :google_oauth2, '383068515533-td0rr5cr9aonf6l15ulb67dbsebul8pc.apps.googleusercontent.com', 'U4VbH-89--KYEg0LpstPfu6O', {client_options: {ssl: {ca_file: Rails.root.join("cacert.pem").to_s}}}
end
