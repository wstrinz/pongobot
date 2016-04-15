require 'slack-ruby-bot'

class PongBot < SlackRubyBot::Bot
  command 'ping' do |client, data, match|
    client.say(text: 'pong', channel: data.channel)
    client.say(text: 'Thanks for participating.',
               gif: %w(thanks sweet kudos cheers dinosaur).sample,
               channel: data.channel)
  end
end

PongBot.run
