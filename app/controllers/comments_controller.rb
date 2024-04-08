class CommentsController < ApplicationController
  def create
    @comment = Comment.new 
    @comment.photo_id = params.fetch("input_photo_id")
    @comment.author_id = params.fetch("input_author_id")
    @comment.body = params.fetch("input_comment")

    if @comment.valid?
      @comment.save
      redirect_to("/photos/#{@comment.photo_id}", { :notice => "Comment created successfully." })
    else
      redirect_to("/photos/#{@comment.photo_id}", { :notice => "Comment failed to create successfully." })
    end
  end
end
