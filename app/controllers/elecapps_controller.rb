class ElecappsController < ApplicationController
skip_before_action :verify_authenticity_token
 
 #POST /elecapps
 #POST /elecapps.json
 def create
  @elecapp = Elecapp.new(from: params[:from], to: params[:to], text: params[:text], date: params[:date], ATXid: params[:ATXid], linkId: params[:linkId])
  respond_to do |format|
   if @elecapp.save
    format.html { redirect_to @elecapp, notice: "saved successfully"}
    format.json { render json: @elecapp}
   end
  end
 end
 
=begin
before_action :authenticate_user!
#GET /elecapps
#GET /elecapps.json

# def index
#  render json: Elecapp.all
# end


 def index
  @day = Elecapp.where(created_at: (Time.now.midnight-1.day)..Time.now.midnight)
  @data = @day.where(from: 'current_user.phone_Number').pluck(:text, :created_at)


  d = []
  @data.each do |data|
   d << [data.keys.first, DateTime.parse(data.values.first).to_i*1000]
  end

  @chart = LazyHighCharts::HighChart.new('chart') do |f|
   f.chart(:height => '400')
   f.yAxis[:title => {:text => "Usage(Watt)", :margin => 20, style: { color: '#333'}}]
   f.xAxis(type: 'datetime')
   f.series(:type => 'area', :name => '24Hrs', :data => d)
  end
 end

 def day   
  @day = Elecapp.where(created_at: (Time.now.midnight-1.day)..Time.now.midnight)
  @data = @day.where(from: 'current_user.phone_Number').pluck(:text, :created_at)
  

  d = []
  @data.each do |data|
   d << [data.keys.first, DateTime.parse(data.values.first).to_i*1000]
  end

  @chart = LazyHighCharts::HighChart.new('chart') do |f|
   f.chart(:height => '400')
   f.yAxis[:title => {:text => "Usage(Watt)", :margin => 20, style: { color: '#333'}}]
   f.xAxis(type: 'datetime')
   f.series(:type => 'area', :name => '24Hrs', :data => d)
  end
 end

 def month
  @month = Elecapp.where(created_at: (Time.now.midnight-30.day)..Time.now.midnight)
  @data = @month.where(from: 'current_user.phone_Number').pluck(:text, :created_at)
  

  d = []
  @data.each do |data|
   d << [data.keys.first, DateTime.parse(data.values.first).to_i*1000]
  end

  @chart = LazyHighCharts::HighChart.new('chart') do |f|
   f.chart(:height => '400')
   f.yAxis[:title => {:text => "Usage(Watt)", :margin => 20, style: { color: '#333'}}]
   f.xAxis(type: 'datetime')
   f.series(:type => 'area', :name => 'Month', :data => d)
  end

 end

 def week 
  @week = Elecapp.where(created_at: (Time.now.midnight-7.day)..Time.now.midnight)
  @data = @week.where(from: 'current_user.phone_Number').pluck(:text, :created_at)
  

  d = []
  @data.each do |data|
   d << [data.keys.first, DateTime.parse(data.values.first).to_i*1000]
  end

  @chart = LazyHighCharts::HighChart.new('chart') do |f|
   f.chart(:height => '400')
   f.yAxis[:title => {:text => "Usage(Watt)", :margin => 20, style: { color: '#333'}}]
   f.xAxis(type: 'datetime')
   f.series(:type => 'area', :name => 'Week', :data => d)
  end 
 end

#POST /elecapps
#POST /elecapps.json
# def create
#  @elecapp = Elecapp.new(from: params[:from], to: params[:to], text: params[:text], date: params[:date], ATXid: params[:ATXid], linkId: params[:linkId])
#  respond_to do |format|
#   if @elecapp.save
#    format.html { redirect_to @elecapp, notice: "saved successfully"}
#    format.json { render json: @elecapp}
#   end
#  end
# end
=end

end

