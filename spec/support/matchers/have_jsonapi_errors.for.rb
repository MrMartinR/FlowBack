RSpec::Matchers.define :have_jsonapi_error_format do
  match do |actual|
    return false unless actual['errors']

    true
  end

  failure_message do |actual|
    "#{actual}: \n is expected to contain errors object"
  end

  failure_message_when_negated do |actual|
    "#{actual}: \n is expected to not contains errors object"
  end
end
