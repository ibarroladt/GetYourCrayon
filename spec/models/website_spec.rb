require 'spec_helper'

describe Website do 

  context 'with no url' do
    it 'should not be valid' do
      new_website = Website.new
      new_website.save
      new_website.should_not be_valid
    end
  end

  context 'with invalid data' do
    it 'should not be valid' do
      new_website = Website.new(url: "3")
      new_website.save
      new_website.should_not be_valid
    end
  end

  context 'with expected data' do
    it 'creates a website record' do
      new_website = Website.new(url: "http://www.google.com")
      new_website.save
      new_website.should be_valid
    end
  end

  context 'has associations' do
    it 'has_many drawings' do
      w = Website.new
      w.should respond_to(:drawings)
    end

    it 'has_many taggings' do
      w = Website.new
      w.should respond_to(:taggings)
    end

    it 'has_many tags' do
      w = Website.new
      w.should respond_to(:tags)
    end
  end

end
