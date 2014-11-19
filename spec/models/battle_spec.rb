require 'rails_helper'

describe Battle do
  subject { Battle.find(7) }

  it_should_behave_like("YamlLoader", Battle)
end
