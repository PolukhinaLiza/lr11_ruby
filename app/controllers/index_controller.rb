require 'prime'
require 'json'
class IndexController < ApplicationController
  @result = 0
  @reloading = false
  def input
    @value = 'IT IS VALUE'
  end

  def output
    input_line = params[:value]
    if input_line.nil?
      @error = 'Некорректный ввод' 
    elsif input_line.scan(/\D/).any? || input_line.empty?  
      @error = 'Некорректный ввод'
    elsif input_line.to_f<0
      @error = 'Некорректный ввод'
    else
      @result=input_line.to_f

 

    
    if !Rafson.exists?(number: @result)
      @reloading = true
      @mas = generate(@result)
      Rafson.create(number: @result, array: @mas.to_json())
    else
      @reloading = false
      #print "debug\n\n\n\n\n\n\n\n\n"
      rec = Rafson.find_by(number: @result)
      @mas = JSON.parse(rec.array)
    end
  end
    
  def all
    fin = []
    Rafson.all.each do |x|
      if x.number.present?
        hash = { number: x.number, mas_iteration: x.array}
        fin.push(hash)
      end
    end
    # Прогружаем страницу в зависимости от данных
    if fin.any?(&:present?)
      render xml: fin.to_xml
    else
      render plain: 'No data'
    end
  end
  end
  private
  def generate(input_line)
      a = input_line
      x=input_line
      array=[]
      array.push(x)
      while ((x**2-a)/a)>=0.001 
        x1=(1/2.0)*(x+(a/x)) 
        x=x1.round(3)
        array.push(x)
      end
      return array
  end
end
