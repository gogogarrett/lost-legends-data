shared_examples_for "YamlLoader" do |klass|
  describe "::find" do
    it "returns abc instance" do
      subject.should be_kind_of klass
    end

   it "raises AR error when id not found" do
      expect { klass.find(0) }.to raise_error ActiveRecord::RecordNotFound
      expect { klass.find(nil) }.to raise_error ActiveRecord::RecordNotFound
    end
  end

  describe "::all" do
    it "returns an array of abc instances" do
      klass.all.each { |u| u.should be_kind_of klass }
    end
  end
end
