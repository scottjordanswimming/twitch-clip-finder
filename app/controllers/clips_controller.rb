class ClipsController < ApplicationController
  before_action :redirect_if_not_logged_in
  skip_before_action :redirect_if_not_logged_in, only: [:index]

  def index
    @clips = Clip.all
    @user = current_user
    @reviewed = @user.reviewed_clips

  end

  def show
    @clip = Clip.find(params[:id])
  end

  def new
    @clip = Clip.new
  end

  def create
    #render plain: params[:clip].inspect
    @clip = current_user.clips.build(clip_params)
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

    private
    def clip_params
      params.require(:clip).permit(:title, :url, :streamer_id, :streamer_ids => [], :streamers_attributes => [:name, :favorite])
    end
end
