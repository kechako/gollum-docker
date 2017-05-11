require 'omnigollum'
require 'omniauth-slack'

wiki_options = {
  live_preview: true,
  allow_uploads: true,
  allow_editing: true,
}
Precious::App.set(:wiki_options, wiki_options)

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
