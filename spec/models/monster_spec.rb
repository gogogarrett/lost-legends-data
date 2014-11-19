require 'rails_helper'

describe Monster do
  subject { Monster.find(1) }

  it_should_behave_like("YamlLoader", Monster)
end
