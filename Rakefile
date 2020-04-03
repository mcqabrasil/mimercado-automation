require "time"

namespace :mimercado do
  task :runtest, [:browser] do |task, args|
    ENV['BROWSER'] = args[:browser]

    time = Time.now.utc.iso8601.tr(":", "")
    report = "--format html --out=log/report_#{time}.html"
    command = "rspec #{report} --backtrace"
    puts command
    sh command

    #Rake::Task['mcfadyen:work'].invoke(args[:browser])
  end

  task :runtag, [:tags, :browser] do |task, args|
    ENV['BROWSER'] = args[:browser]

    time = Time.now.utc.iso8601.tr(":", "")
    report = "--format html --out=log/report_#{time}.html"
   # report = "-f RspecYahFormatter --out=rspec_html_reports/test_#{time}.html"
    command = "rspec --tag #{args[:tags]} #{report} --backtrace" #- usando Rspec clássico
   # command = "rspec -f RspecHtmlFormatter --tag #{args[:tags]} --backtrace" #-- usando RSPEC HTML report que funciona bem
   # command = "rspec #{report} --tag #{args[:tags]} --backtrace"
  # command = "bundle exec rspec -f RspecHtmlReporter --tag #{args[:tags]} --backtrace"

    puts command
    sh command
  end
end
