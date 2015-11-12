class UsageController < ApplicationController

before_filter :set_current_user
before_action :authenticate_user!

#GET /usage
#GET /usage.json

# def index
#  render json: Elecapp.all
# end

 def index
  @day = Elecapp.where(created_at: (Time.now.beginning_of_day)..Time.now.end_of_day)
  @data = @day.pluck(:text, :date)


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

 def day
  session[:phone_Number] = User.current.phone_Number
  @day = Elecapp.where(created_at: (Time.now.beginning_of_day)..Time.now.end_of_day)
  @data = @day.where(from: session[:phone_Number]).pluck(:text, :date).take(20)


  d = []
  cat = []
  pie = []
  @data.each do |key, value|
   d << key
   cat << value
   pie << [value, key]
  end

  @chart = LazyHighCharts::HighChart.new('chart') do |f|
   f.chart(:height => '400', type:'line')
   f.yAxis[:title => {:text => "Usage(Watt)", :margin => 20, style: { color: '#333'}}]
   f.xAxis(type: 'datetime', :categories => cat)
   f.series( :name => '24Hrs', :data => pie)
  end
 end

 def month
  session[:phone_Number] = User.current.phone_Number
  @month = Elecapp.where("created_at >= ?", Time.zone.now.beginning_of_month)
  @data = @month.where(from: session[:phone_Number]).pluck(:text, :date).take(20)

  cat = []
  d = []
  @data.each do |key, value|
   d << key
   cat << value
  end

  @chart = LazyHighCharts::HighChart.new('chart') do |f|
   f.chart(:height => '400')
   f.yAxis[:title => {:text => "Usage(Watt)", :margin => 20, style: { color: '#333'}}]
   f.xAxis(type: 'datetime', :categories => cat)
   f.series(:type => 'area', :name => 'Month', :data => d)
  end

 end

 def week
  session[:phone_Number] = User.current.phone_Number
  @week = Elecapp.where("created_at >= ?", Time.zone.now.beginning_of_week)
  @data = @week.where(from: session[:phone_Number]).pluck(:text, :date).take(20)


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
   f.series(:type => 'area', :name => 'Week', :data => d)
  end
 end

#POST /elecapps
#POST /elecapps.json
# def create
#  @elecapp = Elecapp.new(from: params[:from], to: params[:to], text: params[:text], date: params[:date], ATXid: params[:ATXid], linkId: params$
#  respond_to do |format|
#   if @elecapp.save
#    format.html { redirect_to @elecapp, notice: "saved successfully"}
#    format.json { render json: @elecapp}
#   end
#  end
# end

end



