class DatePickerInput < SimpleForm::Inputs::Base
  def input
    @builder.text_field(attribute_name, :class => 'date_picker', :placeholder => "Select date")
  end
end
