RSpec.describe GmailComposeEncoder do
  it "has a version number" do
    expect(GmailComposeEncoder::VERSION).not_to be nil
  end

  it "encodes-1" do
    expect(GmailComposeEncoder::encode("thread-f:1612772752984004612+msg-a:r7186792049594056342")).to eq('lLtBPXMfwdZJvWLlDhvxCqGbFRRnxnkhTqwPvxpBMCQbxPwdwWXVPRGQFfXwBlzFZRQLLvbX')
  end
  it "encodes-2" do
    expect(GmailComposeEncoder::encode("thread-f:1612800019161438603+msg-a:r-2174453288762984534")).to eq("CqMvqmRFntSzZfVtfBmPPsWMVrdJWrfWKgnmmQnBpjMBHZDDbfzgzMVWSNMwqsjkqbXqVSvsngB")
  end
end
