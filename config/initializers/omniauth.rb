Rails.application.config.middleware.use OmniAuth::Builder do
    provider :github, 'a3aad4927f3828e71197', 'b8e464959bc8e2205e66b38a3c6056d17144003a'
end