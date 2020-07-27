class StreamersController < ApplicationController

    def index
       @streamers = Streamer.all
   end

   def new
 @streamer = Streamer.new
 end

 def destroy
  session.delete :username
end

def show
@streamer = Streamer.find(params[:streamer_id])
end

def favorites

@streamer = Streamer.find_by(params[:favorite])

end

private def streamer_params
params.require(:streamer).permit(:name)
end

end
