RSpec::Matchers.define :have_error do |error|
  match do |actual|
    expect(actual).to have_key('errors')
    expect(actual['errors']).to be_an_instance_of(Array)
    return true if error.nil?

    actual['errors'].any? do |object|
      expect(object.symbolize_keys).to include(detail: error)
    end
  end

  description do
    'contain errors object'
  end

  failure_message do |actual|
    "#{JSON.pretty_generate(actual)}:\n" \
    'is expected to contain errors object'
  end

  failure_message_when_negated do |actual|
    "#{JSON.pretty_generate(actual)}:\n" \
    'is expected not to contain errors object'
  end
end
