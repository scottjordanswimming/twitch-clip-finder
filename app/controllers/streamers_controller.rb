class StreamersController < ApplicationController

    def index
       @streamers = Streamer.alpha
   end

   def new
 @clip = Clip.new
 end

 def destroy
  session.delete :username
end

end
