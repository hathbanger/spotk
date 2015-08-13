class CommentsController < ApplicationController
	before_action :authenticate_user!

	def create
		@trick = Trick.find(params[:trick_id])
		@comment = Comment.create(params[:comment].permit(:content))
		@comment.user_id = current_user.id
		@comment.trick_id = @trick.id

		if @comment.save
			redirect_to trick_path(@trick)
		else
			render 'new'
		end
	end
end
