# GmailComposeEncoder

Welcome to your new gem! In this directory, you'll find the files you need to be able to package up your Ruby library into a gem. Put your Ruby code in the file `lib/gmail_compose_encoder`. To experiment with that code, run `bin/console` for an interactive prompt.

gmail_compose_encoder is a ruby implementation of googles - specifically gmails - url encoding scheme for opening the gmail in "compose message" mode on a particular draft email.

In particular, it is the ruby answer to this question:

What do I put into the URI querystring of the new Gmail UI to view a draft message created by the Gmail API?

--

If I view a draft message in the new Gmail UI, the URI is something like this:

https://mail.google.com/mail/u/1/?zx=iij9apqgzdf4#drafts?compose=jrjtXSqXwlFGnSGCQgDCdnHGVFdlpFMgzsCNgpQstQLxdLCMkjKstBmWZkCmjhWTQnpsZCJF

Specifically, referenced in this SO article https://stackoverflow.com/questions/50124112/how-does-a-gmail-message-id-or-threadid-map-to-the-new-gmail-ui
## Installation

Add this line to your application's Gemfile:

```ruby
gem 'gmail_compose_encoder'
```

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install gmail_compose_encoder

## Usage
  depends on the google-apis gem, you'd use it something like this:
```ruby
    # assume gmail_authorization_token is your GoogleOauthToken,
    # and you've created gmail_draft_id via the API.
    draft = gmail_authorization_token.with_gmail_service do |client|
        client.get_user_draft('me', gmail_draft_id)
    end
    # then this call creates a url that you can use in the browser to open
    # a gmail tab with the draft opened in compose mode
    GmailComposeEncoder.compose_draft_url(from_address, draft.message.thread_id, draft.message.id)
```
## Development

After checking out the repo, run `bin/setup` to install dependencies. Then, run `rake spec` to run the tests. You can also run `bin/console` for an interactive prompt that will allow you to experiment.

To install this gem onto your local machine, run `bundle exec rake install`. To release a new version, update the version number in `version.rb`, and then run `bundle exec rake release`, which will create a git tag for the version, push git commits and tags, and push the `.gem` file to [rubygems.org](https://rubygems.org).

## Contributing

Bug reports and pull requests are welcome on GitHub at https://github.com/[USERNAME]/gmail_compose_encoder. This project is intended to be a safe, welcoming space for collaboration, and contributors are expected to adhere to the [Contributor Covenant](http://contributor-covenant.org) code of conduct.

## License

The gem is available as open source under the terms of the [MIT License](https://opensource.org/licenses/MIT).

## Code of Conduct

Everyone interacting in the GmailComposeEncoder project’s codebases, issue trackers, chat rooms and mailing lists is expected to follow the [code of conduct](https://github.com/[USERNAME]/gmail_compose_encoder/blob/master/CODE_OF_CONDUCT.md).
