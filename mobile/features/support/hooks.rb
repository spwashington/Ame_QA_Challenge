require 'report_builder'
    
at_exit do
  ReportBuilder.configure do |config|
    config.input_path = 'log/report_result.json'
    config.report_path = 'log/report_result'
    config.report_title = "Result of test in APK"
    config.additional_info = {Device: ENV['DEVICE'], System: ENV['PLATFORM'], Version: ENV['VERSION'], Perfil: ENV['CAPS']}
    config.color = 'blue'
  end
  ReportBuilder.build_report
end