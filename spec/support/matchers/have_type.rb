RSpec::Matchers.define :have_type do |type|
  match do |actual|
    actual['data']['type'] == type.to_s
  end

  description do
    "have a type of #{type}"
  end

  failure_message do |actual|
    "#{JSON.pretty_generate(actual)}\n" \
    "is expected to have a type of:\n"\
    "#{type.to_s.inspect}\n"\
    "but the actual type is:\n"\
    "#{actual['data']['type'].inspect}"
  end

  failure_message_when_negated do |actual|
    "#{JSON.pretty_generate(actual)}\n" \
    "is expected to not have a type of:\n"\
    "#{type.to_s.inspect}\n"\
    "but the actual type is:\n"\
    "#{actual['data']['type'].inspect}"
  end
end
