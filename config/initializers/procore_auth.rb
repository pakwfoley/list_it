Rails.application.config.middleware.use OmniAuth::Builder do
  provider :procore,
    ENV.fetch("CLIENT_ID"),
    ENV.fetch("CLIENT_SECRET")
end
