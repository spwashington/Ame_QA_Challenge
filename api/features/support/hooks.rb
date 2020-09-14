require 'report_builder'
   
at_exit do
  ReportBuilder.configure do |config|
    config.input_path = 'features/log/report_result.json'
    config.report_path = 'features/log/report_result'
    config.report_title = "Result of test in API"
    config.additional_info = {API_Url: ENV['API']}
    config.color = 'blue'
  end
  ReportBuilder.build_report
end