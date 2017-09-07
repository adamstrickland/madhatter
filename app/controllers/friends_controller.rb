class FriendsController < ApplicationController
  def index
    @friends = Friend.all
  end

  def new
    @friend = Friend.new
  end

  def create
    @friend = Friend.new(friend_params)

    if @friend.save
      redirect_to action: :index
    else
      render action: 'new'
    end
  end

  private

  def friend_params
    params.require(:friend).permit(:avatar, :name)
  end
end
