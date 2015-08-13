class TricksController < ApplicationController
	before_action :find_trick, only: [:show, :edit, :update, :destroy, :upvote, :downvote]
	before_action :authenticate_user!, except: [:index, :show]

	def index
		@tricks = Trick.all.order("created_at DESC")
	end
	
	def show
		@comments = Comment.where(trick_id: @trick)
	end

	def new
		@trick = current_user.tricks.build
	end

	def create
		@trick = current_user.tricks.build(trick_params)

		if @trick.save
			redirect_to @trick
		else
			render 'new'
		end
	end

	def edit
	end

	def update
		if @trick.update(trick_params)
			redirect_to @trick
		else
			render 'edit'
		end
	end

	def destroy
		@trick.destroy
		redirect_to root_path
	end


	def upvote
		@trick.upvote_by current_user
		redirect_to :back
	end

	def downvote
		@trick.downvote_by current_user
		redirect_to :back
	end

	private

	def find_trick
		@trick = Trick.find(params[:id])
	end

	def trick_params
		params.require(:trick).permit(:title, :image)
	end
end
