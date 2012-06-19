prawn_document(:filename => @project.name + ".pdf") do |pdf|
  pdf.font_size = 25
  pdf.text @project.name, :style => :bold

  @project.phases.each do |phase|
    pdf.font_size = 18
    pdf.text phase.title
    pdf.font_size = 12
    pdf.text phase.document.body if phase.document.body.present?
    phase.activities.each do |activity|
      pdf.font_size = 15
      pdf.text activity.title if activity.title.present?
      pdf.font_size = 12
      pdf.text activity.document.body if activity.document.body.present?
    end
  end
end
