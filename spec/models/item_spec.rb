require 'rails_helper'

describe Item do
  subject { Item.find(1) }

  it_should_behave_like("YamlLoader", Item)
end
