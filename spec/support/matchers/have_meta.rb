RSpec::Matchers.define :have_meta do |member, value|
  match do |actual|
    expect(actual).to have_key('meta')
    expect(actual['meta']).to have_key(member)

    return true if value.nil?

    expect(actual['meta'][member]).to eq(value)
  end

  description do
    'contain meta object'
  end

  failure_message do |actual|
    "#{JSON.pretty_generate(actual)}:\n" \
    'is expected to contain meta object'
  end

  failure_message_when_negated do |actual|
    "#{JSON.pretty_generate(actual)}:\n" \
    'is expected not to contain meta object'
  end
end
