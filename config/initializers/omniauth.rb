OmniAuth.config.logger = Rails.logger

Rails.application.config.middleware.use OmniAuth::Builder do
  provider :google_oauth2, '1072194987322-r3j8gt6klq99pcj4cje6kjlfatvk2e92.apps.googleusercontent.com', 'Aq6VLB1cvePxfvYcoLMG5VDU ', {client_options: {ssl: {ca_file: Rails.root.join("cacert.pem").to_s}}}
end
