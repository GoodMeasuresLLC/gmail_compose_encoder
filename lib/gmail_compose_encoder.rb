require "gmail_compose_encoder/version"
require 'gmail_compose_encoder/encoder'

module GmailComposeEncoder
  def self.compose_draft_url(from_address, thread_id, message_id)
    tmp=encode("thread-f:#{thread_id.to_i(16)}+msg-a:r#{message_id.to_i(16)}")
    "https://mail.google.com/mail/u/#{from_address}/#all?compose=#{tmp}"
  end
end
