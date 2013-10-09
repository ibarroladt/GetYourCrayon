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
        d.should respond_to(:tags=)
      end

      it 'creates the right number of tags' do 
        d = Drawing.create!(content:"sjkhdgf",website_id: 2)
        d.tags=('one, two three')
        d.reload
        d.tags.length.should == 3
      end

      it 'creates the right tags names' do 
        d = Drawing.create!(content:"sjkhdgf",website_id: 2)
        d.tags=('one, two three')
        d.reload
        d.tags.order('name DESC')[0].name == "one"
      end
  end

   context 'create_url' do
      it 'has method' do 
        d = Drawing.new
        d.should respond_to(:create_url )
      end

      it 'creates the right number of tags' do 
        d = Drawing.create!(content:"sjkhdgf",website_id: 2)
        Drawing.last.unique_url.length.should eq 5
      end
  end

  context 'set_unique_url' do
      it 'has method' do 
        d = Drawing.new
        d.should respond_to(:set_unique_url )
      end

      it 'creates a unique_url' do 
        d = Drawing.create!(content:"sjkhdgf",website_id: 2)
        u = Drawing.last.unique_url
        expect(d.set_unique_url(u)).to eq "repeat"
      end
  end

end

