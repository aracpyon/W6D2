class CommentsController < ApplicationController
    def index
        if params.has_key?(:artwork_id)
            @comments = Comment.comments_for_id(params[:artwork_id])
        elsif params.has_key?(:user_id)
            @comments = Comment.comments_for_id(params[:user_id])
        else
            @comments = Comment.all
        end

        render json: @comments
    end

    def create
        comment = Comment.new(comment_params)
        if comment.save
            render json: comment
        else
            render json: comment.errors.full_messages, status: 422
        end
    end

    def destroy
        comment = Comment.find(params[:id])
        comment.destroy
        render json: "Successfully destroyed the comment."
    
    end


    private

    def comment_params
        params.require(:comment).permit(:artwork_id, :user_id, :body)
    end
end