class DatePickerInput < SimpleForm::Inputs::Base
  def input
    @builder.text_field(attribute_name, :class => 'datepicker ', :placeholder => "Select date")
  end
end
