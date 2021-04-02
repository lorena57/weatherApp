class MainController < ApplicationController
  def index
    require 'net/http'
    require 'json'
    @url = 'https://www.airnowapi.org/aq/observation/zipCode/current/?format=application/json&zipCode=90210&distance=5&API_KEY=8ACBE8C4-BE62-4D88-9EBD-E56CF0CE5107'
    @uri = URI(@url)
    @response = Net::HTTP.get(@uri)
    @output = JSON.parse(@response)

    if @output.empty?
      @final_output = 'Error'
    elseif !@output
    @final_output = 'Error'
    else
      @final_output = @output[0]['AQI']
    end 

    if @final_output ==="Error"
      @api_color = 'gray'
    elsif @final_output <= 50
      @api_color = 'green'
    elsif @final_output >= 51 && final_output <= 100
      @api_color = 'yellow'
    elsif @final_output >= 101 && final_output <= 150
      @api_color = 'orange'
    elsif @final_output >= 151 && final_output <= 200
      @api_color = 'red'
    elsif @final_output >= 201 && final_output <= 300
      @api_color = 'purple'
    elsif @final_output >= 301 && final_output <= 500
      @api_color = 'maroon'



      
    end

    
  end

  
end
