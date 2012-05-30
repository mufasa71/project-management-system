require 'spec_helper'

describe "appointments/edit" do
  before(:each) do
    @appointment = assign(:appointment, stub_model(Appointment,
      :description => "MyString",
      :location => "MyString"
    ))
  end

  it "renders the edit appointment form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form", :action => appointments_path(@appointment), :method => "post" do
      assert_select "input#appointment_description", :name => "appointment[description]"
      assert_select "input#appointment_location", :name => "appointment[location]"
    end
  end
end
