require 'rails_helper'

describe Zone do
  subject { Zone.find(1) }

  it_should_behave_like("YamlLoader", Zone)
end
