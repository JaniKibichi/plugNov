class HomeController < ApplicationController
 def index
  @day = Elecapp.order(created_at: :desc).where(created_at: (Time.now.beginning_of_year)..Time.now.end_of_day)
  @data = @day.pluck(:text, :date).take(50)
 

  d = []
  cat = []
  @data.each do |key, value|
   d << key
   cat << value
  end

  @chart = LazyHighCharts::HighChart.new('chart') do |f|
   f.chart(:height => '400')
   f.yAxis[:title => {:text => "Usage(Watt)", :margin => 20, style: { color: '#333'}}]
   f.xAxis(type: 'datetime', :categories => cat)
   f.series(:type => 'area', :name => '24Hrs', :data => d)
  end
 end
end
