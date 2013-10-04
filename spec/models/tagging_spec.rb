require 'spec_helper'

describe Tagging do 

  context 'with invalid input' do
    it 'with drawing_id and no tag_id ' do
      new_tagging = Tagging.new
      new_tagging.save
      new_tagging.should be_valid
    end
  end

  context 'with expected data' do
    it 'creates a tagging record' do
      new_tagging = Tagging.new(drawing_id: 3, tag_id: 3)
      new_tagging.save
      new_tagging.should be_valid
    end
  end
 
  context 'has associations' do
    it 'belongs_to drawing' do
      t = Tagging.new
      t.should respond_to(:drawing)
    end

    it 'belongs_to tag' do
      t = Tagging.new
      t.should respond_to(:tag)
    end
  end
end
