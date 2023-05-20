if Rails.env === 'production' 
    Rails.application.config.session_store :cookie_store, key: '_wms', domain: 'wms', tld_length: 2
  else
    Rails.application.config.session_store :cookie_store, key: '_wms'
  end
