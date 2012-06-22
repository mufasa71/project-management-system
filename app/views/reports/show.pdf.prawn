prawn_document(:filename => @project.name + "_report_" + @report.created_at.to_date.to_s + ".pdf") do |pdf|
  pdf.font_size = 20
  pdf.define_grid(:columns => 2, :rows => 5, :gutter => 10)
  pdf.grid([0,0], [0,1]).bounding_box do
    pdf.text "Progress Report " + @report.created_at.to_date.to_s, :style => :bold
  end
  pdf.font_size = 16
  pdf.grid(1,0).bounding_box do
    pdf.text "PROJECT PROGRESS REPORT"
    pdf.text "AS AT " + @report.created_at.strftime("%d %b, %Y")
    pdf.text "System: " + @project.name
  end
  pdf.grid(1,1).bounding_box do
    pdf.text "Prepared By: " + @report.prepared_by
    pdf.text "Date of Last Report: " + @project.reports.last.created_at.strftime("%d %b, %Y")
    pdf.text "Report number: " + (@project.reports.index(@report) + 1).to_s
  end
  pdf.font_size = 12
  pdf.grid([2,0], [2,1]).bounding_box do
    pdf.text "COMPLETED SINCE LAST REPORT", :style => :bold
    last_report = @project.reports.where("created_at < ?", @report.created_at).reverse.first
    unless last_report.nil?
      data_table = [["Description", "Date Completed"],[last_report.description, last_report.created_at.strftime("%d/%m/%Y")]]
      pdf.table data_table, 
        :row_colors => ["FFFFFF", "DDDDDD"],
        :header => true,
        :column_widths => [400, 100]
    end
  end  
  pdf.grid([3,0], [3,1]).bounding_box do
    pdf.text "IN PROGRESS", :style => :bold
    data_table = [["Activity","Description", "Est. Compl. Date"]]
    count = 0
    if @report.activities.any?
      data_table += @report.activities.map do |activity|
        [ (count += 1), activity.title, activity.event.end_at.strftime("%d/%m/%Y")]
      end
    end
    pdf.table data_table, 
      :row_colors => ["FFFFFF", "DDDDDD"],
      :header => true,
      :column_widths => [50, 350, 100]
  end  
  pdf.grid([4,0], [4,1]).bounding_box do
    pdf.text "ISSUES/COMMENTS", :style => :bold
    pdf.font_size 11
    pdf.text @report.comments
  end 
end
