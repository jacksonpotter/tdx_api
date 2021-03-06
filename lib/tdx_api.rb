require 'dotenv/load'
require 'rest-client'
require 'jwt'
require 'tdx_api/version'
require 'tdx_api/named_struct'
require 'tdx_api/client'
require 'tdx_api/snakeify' # this must be required before ::Connection, since it depends on ::Snakeify
require 'tdx_api/connection'
require 'tdx_api/authentication'
require 'tdx_api/ticket_app'
require 'tdx_api/ticket'
require 'tdx_api/asset_app'
require 'tdx_api/asset'
require 'tdx_api/snakeify'

module TdxApi
  # Your code goes here...
end
