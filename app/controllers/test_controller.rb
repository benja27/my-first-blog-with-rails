class TestController < ApplicationController
  def index
    @user = User.new()    
    if @user.save
      puts "user generado con exito"
    else
    end
  end
  def create
    @user = User.new()    
    if @user.save
      puts "user generado con exito"
    else
    end
  end
end
