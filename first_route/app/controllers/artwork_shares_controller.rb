class ArtworkSharesController < ApplicationController
    # require "byebug"
    def index #question: how does params work under the hood
        # debugger
        if params.has_key?(:artwork_id)
            @shares = ArtworkShare.where(artwork_id: params[:artwork_id])
        else
            @shares = ArtworkShare.all #what does this do? just empty array?
        end
        render json: @shares
    end

    def create
        artwork_share = ArtworkShare.new(artwork_share_params)
        if artwork_share.save
            render json: artwork_share
        else
            render json: artwork_share.errors.full_messages, status: 422
        end
    end

    def destroy
        artwork_share = ArtworkShare.find(params[:id])
        artwork_share.destroy
        render json: "Successfully destroyed share of artwork#{artwork_share.artwork.title} by #{artwork_share.viewer.username}"
    end #Question 1: Is there any way to interpolate the title of the artwork and name of the user
        #Question 2: Would we write the SQL query in the model file?

    private
    def artwork_share_params
        params.require(:artwork_share).permit(:artwork_id, :viewer_id)
    end
end
