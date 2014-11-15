class Item < OpenStruct
  DB = YAML.load_file(File.open("db/fixtures.yml"))

  class << self
    def all
      DB["load_items"].map do |zone_json|
        new(zone_json[1])
      end
    end

    def find(id)
      yaml = DB["load_items"].find { |yml_id, _data| yml_id.to_i == id.to_i }
      raise "no yaml you idiot.. id: #{id}" unless yaml
      new(yaml[1])
    end
  end

  def initialize(data)
    super(data)
  end
end
