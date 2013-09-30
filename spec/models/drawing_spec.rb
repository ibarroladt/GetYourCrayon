require 'spec_helper'

describe Drawing do 


  context 'with invalid input' do
    it 'with no content and no website id' do
      new_drawing = Drawing.new
      new_drawing.save
      new_drawing.should_not be_valid
    end

      it 'with just content' do
      new_drawing = Drawing.new(content: "test")
      new_drawing.save
      new_drawing.should_not be_valid
    end

      it 'with just website_id' do
      new_drawing = Drawing.new(website_id: 2)
      new_drawing.save
      new_drawing.should_not be_valid
    end
  end


  context 'with expected data' do
    it 'creates a drawing record' do
      new_drawing = Drawing.new(content: "test", website_id: 4)
      new_drawing.save
      new_drawing.should be_valid
    end
  end

  context 'has associations' do
    it 'belong to a website' do
      d = Drawing.new
      d.should respond_to(:website)
    end

    it 'has_many taggings' do
      d = Drawing.new
      d.should respond_to(:taggings)
    end

    it 'has_many tags' do
      d = Drawing.new
      d.should respond_to(:tags)
    end
  end

  context '#tags=' do
      it 'has method' do 
        d = Drawing.new
        d.should respond_to(:tags= )
      end


      # it 'takes a string' do 
      #   d = Drawing.new
      #   d.tags=(2).should raise_error(ArgumentError)
      # end

      # it 'has method' do 
      #   w = Website.create(url: "http://www.google.com")
      #   expect(d = w.drawings.create(content: "s", tags: "tag1 tag2")).to change(.tags, :count).by(2)
      # end
  end

end

