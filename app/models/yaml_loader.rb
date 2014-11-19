class YamlLoader < OpenStruct
  DB = YAML.load_file(File.open("db/fixtures.yml"))

  class_attribute :category

  class << self
    def all
      DB["load_#{category}"].map do |zone_json|
        new(zone_json[1])
      end
    end

    def find(id)
      yaml = DB["load_#{category}"].find { |yml_id, _data| yml_id.to_i == id.to_i }
      raise ActiveRecord::RecordNotFound unless yaml
      new(yaml[1])
    end
  end

  def initialize(data)
    super(data)
  end
end
