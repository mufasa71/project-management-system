prawn_document(:filename => @project.name + "_workload_matrix.pdf") do |pdf|
  pdf.font_size = 25
  pdf.text @project.name << " Workload Matrix", :style => :bold

  pdf.font_size = 16
  det = [["Components/Students"]]
  @project.members.map{|member| det[0] << member.to_s }
  det += @project.phases.map do |phase|
    n = [ phase.title ]
    @project.members.map{|member| n << member.workload_for(phase)}
    n
  end
  
  pdf.table det,
    :row_colors => ["FFFFFF", "DDDDDD"],
    :header => true
end
