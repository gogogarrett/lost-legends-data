class Monster < YamlLoader
  self.category = 'monsters'

  def health
    (10..50).to_a.sample
  end
end
