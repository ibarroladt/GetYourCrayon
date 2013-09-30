require 'spec_helper'

describe Tag do 

  context 'with invalid input' do
    it 'no name' do
      new_tag = Tag.new
      new_tag.save
      new_tag.should_not be_valid
    end
  end

  context 'with expected data' do
    it 'creates a tag record' do
      new_tag = Tag.new(name: "test")
      new_tag.save
      new_tag.should be_valid
    end
  end

  context 'has associations' do
    it 'has_many websites' do
      t = Tag.new
      t.should respond_to(:websites)
    end

    it 'has_many taggings' do
      t = Tag.new
      t.should respond_to(:taggings)
    end

    it 'has_many drawings' do
      t = Tag.new
      t.should respond_to(:drawings)
    end
  end
end
