require 'spec_helper'

describe "appointments/new" do
  before(:each) do
    assign(:appointment, stub_model(Appointment,
      :description => "MyString",
      :location => "MyString"
    ).as_new_record)
  end

  it "renders new appointment form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form", :action => appointments_path, :method => "post" do
      assert_select "input#appointment_description", :name => "appointment[description]"
      assert_select "input#appointment_location", :name => "appointment[location]"
    end
  end
end
