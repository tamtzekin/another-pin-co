# Get the right key based on what env you're in
Stripe.api_key = Rails.application.credentials.stripe[:stripe_secret_key]
