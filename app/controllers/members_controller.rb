class MembersController < ApplicationController
  
  def new
    @member = Member.new
  end
  
  def create
    @member = Member.new(new_params)
    if @member.save
      redirect_to @member
    else
      render 'new'
    end
  end
  
  def index
    @members = Member.all
  end
  
  def show
    @member = Member.find(params[:id])
  end
  
  def edit
    @member = Member.find(params[:id])
  end
  
  def update
    @member = Member.find(params[:id])
    if @member.updateattributes(new_params)
      redirect_to @member
    else
      render 'edit'
    end
  end
  
  def destroy
    Member.find(params[:id]).destroy
    redirect_to members_url
  end
  
  private 
  
  def new_params
    params.require(:member).permit(:name, :last_name, :email, :address, :postal)
  end
  
end
