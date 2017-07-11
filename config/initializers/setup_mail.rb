if Rails.env.development? || Rails.env.production?
    ActionMailer::Base.delivery_method = :smtp
    ActionMailer::Base.smtp_settings = {
        address:            'smtp.gmail.com',
        port:               '2525',
        authentication:     :plain,
        user_name:          'sh1tgs@gmail.com',
        password:           'clerks12',
        domain:             'heroku.com',
        enable_starttls_auto: true
    }
    
    ActionMailer::Base.perform_deliveries = true
    ActionMailer::Base.raise_delivery_errors = true
end