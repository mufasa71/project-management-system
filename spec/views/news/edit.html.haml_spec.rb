require 'spec_helper'

describe "news/edit" do
  before(:each) do
    @news = assign(:news, stub_model(News,
      :title => "MyString",
      :summary => "MyText",
      :description => "MyText"
    ))
  end

  it "renders the edit news form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form", :action => news_index_path(@news), :method => "post" do
      assert_select "input#news_title", :name => "news[title]"
      assert_select "textarea#news_summary", :name => "news[summary]"
      assert_select "textarea#news_description", :name => "news[description]"
    end
  end
end
