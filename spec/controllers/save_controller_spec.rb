  require 'spec_helper'

describe SaveController do 

  let(:url){"https://www.google.com/"}
  let(:website){Website.create(url:"https://www.google.com/")}
  let(:drawing){Drawing.new}
  
  let(:create) {double(create: drawing)}
  let(:tags_html_string) {double(tags_html_string: website)}

  let(:last) {double(last: drawing)}
  let(:content) {double(content: "drawing")}
  let(:empty?) {double(empty?: false)}
  let(:length) {double(length: 3)}

  let(:content) {double(content: "drawing")}

  context 'Get to save' do
    before do
      expect(Website).to receive(:find_or_create_by_url).with(url).and_return(website)
      expect(website).to receive(:drawings).and_return(create)
      controller.should_receive(:tags_html_string).with(website).and_return("string")
      expect(drawing).to receive(:unique_url).and_return("AaBb1")
    end

    it 'creates the right response' do 
      get :save, url: url
      drawing_data = JSON.parse(response.body) # {"tags_html_string", => "", "unique_url" => }
      expect(drawing_data["tags_html_string"]).to eq "string"
      expect(drawing_data["unique_url"]).to eq "http://localhost:3000/AaBb1"

    end
  end

  # context 'Post to retrieve' do

  #     it 'renders website not found when url is nil' do 
  #       post :retrieve, url: nil
  #       response.body.should eq "website not found"
  #     end

  #     it 'creates the right response' do 
  #       expect(Website).to receive(:find_by_url).with(url).and_return(website)
  #       # controller.should_receive(:grab_drawing).with(website, 2).and_return("drawing")
  #       expect(website).to receive(:drawings).and_return(last)
  #       expect(website).to receive(:drawingg).and_return(content)
  #       expect(website).to receive(:drawings).and_return(empty?)
  #       expect(website).to receive(:drawings).and_return(length)
        
  #       post :retrieve,  url: url

  #       drawing_data = JSON.parse(response.body)
  #       expect(drawing_data["json_string"]).to eq "string"
  #       # expect(drawing_data["max_index"]).to eq "2"
  #       # expect(drawing_data["tags_html_string"]).to eq "http://localhost:3000/AaBb1"
  #     end
  # end

end


