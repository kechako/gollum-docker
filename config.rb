require 'omnigollum'
require 'omniauth-slack'

options = {
  providers: Proc.new do
    provider :slack, ENV['SLACK_CLIENT_ID'], ENV['SLACK_CLIENT_SECRET'], scope: 'identity.basic,identity.email,identity.team', team: ENV['SLACK_TEAM']
  end,
  dummy_auth: false,

  protected_routes: ['/*'],
  authorized_users: nil,

  author_format: Proc.new { |user| user.name },
  author_email: Proc.new { |user| user.email },
}

Precious::App.set(:omnigollum, options)
Precious::App.register Omnigollum::Sinatra
