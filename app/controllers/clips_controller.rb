class ClipsController < ApplicationController
  http_basic_authenticate_with name: "brad", password:"1234", except: [:index, :show]
  def index
@clips = Clip.all
  end

  def show
@clip = Clip.find(params[:id])
  end

  def new
@clip = Clip.new
  end

  def create
#render plain: params[:clip].inspect
@clip = Clip.new(clip_params)

if(@clip.save)
redirect_to @clip
else
  render 'new'
end
  end

  def edit
@clip = Clip.find(params[:id])
  end

  def update
@clip = Clip.find(params[:id])
if(@clip.update(clip_params))
redirect_to @clip
else
  render 'edit'
end
  end

  def destroy
@clip = Clip.find(params[:id])
@clip.destroy
redirect_to clips_path
  end

  private def clip_params
params.require(:clip).permit(:title, :url)
  end


  # def new
  #       @clip = Clip.new
  #       @clip.build_category
  #   end
  #
  #   def create
  #       @clip = Clip.new(restaurant_params)
  #       @clip.user_id = session[:user_id]
  #
  #      if @clip.save
  #        redirect_to clip_path(@clip)
  #      else
  #       @clip.build_streamer
  #        render :new
  #      end
  #    end
  #
  #   def index
  #     if params[:streamer_id]
  #       streamer = Streamer.find(params[:streamer_id])
  #       @clips = streamer.clips
  #
  #     else
  #       @clips = Clip.order_by_rating.includes(:streamer)
  #     end
  #   end
  #
  #   def show
  #   end
  #
  #   def edit
  #     if authorized_to_edit?(@clip)
  #      render :edit
  #     else
  #      redirect_to clip_path(@clip)
  #     end
  #    end
  #
  #   def update
  #     if @clip.update(clip_params)
  #       redirect_to clip_path(@clip)
  #     else
  #       render :edit
  #     end
  #   end
  #
  #   def most_popular
  #     @clip = Clip.most_popular
  #   end
  #
  #   private

    # def clip_params
    #     params.require(:clip).permit(:name, :price_range, :address, :category_id, category_attributes: [:name])
    #   end

    # def set_restaurant
    #     @clip = Restaurant.find_by(id: params[:id])
    #     redirect_to restaurants_path if !@clipt
    #  end

    #  def redirect_if_not_authorized
    #   if @clip.update(name: params[:name], price_range: params[:price_range], address: params[:address])
    #     redirect_to restaurant_path(@clip)
    #   else
    #     redirect_to user_path(current_user)
    #   end
    # end
end
