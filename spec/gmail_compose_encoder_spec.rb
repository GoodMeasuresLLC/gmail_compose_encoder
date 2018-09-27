RSpec.describe GmailComposeEncoder do
  it "has a version number" do
    expect(GmailComposeEncoder::VERSION).not_to be nil
  end

  it "transliterate" do
    expect(GmailComposeEncoder::encode("thread-f:1612772752984004612+msg-a:r7186792049594056342")).to eq('lLtBPXMfwdZJvWLlDhvxCqGbFRRnxnkhTqwPvxpBMCQbxPwdwWXVPRGQFfXwBlzFZRQLLvbX')
  end
end
