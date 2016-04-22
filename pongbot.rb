require 'slack-ruby-bot'
require 'edn'


class PongBot < SlackRubyBot::Bot
  File.open('data.edn') do |f|
    @text_data = EDN.read(f)
  end

  def self.thank(client, data)
    client.say(text: @text_data[:thanks][:texts].sample,
               gif: @text_data[:thanks][:gifs].sample,
               channel: data.channel)
  end

  command 'ping' do |client, data, match|
    client.say(text: 'pong', channel: data.channel)
    thank client, data
  end
end

PongBot.run
