class TagsController < ApplicationController
    before_action :authenticate_user!
    before_action :set_tag, only: [:show, :edit, :update, :destroy]
  
     # GET /tags
    def index
      @tags = current_user.tags.all
    end
  
     # # GET /tags/1
    # def show
    # end
  
     # GET /tags/new
    def new
      @tag = current_user.tags.new
    end
  
     # GET /tags/1/edit
    def edit
    end
  
     # POST /tags
    def create
      @tag = current_user.tags.new(tag_params)
      

      respond_to do |format|
        format.html { binding.pry }
        format.json { binding.pry }
        format.js { binding.pry }
      end
      #   respond_to do |format|
       
      #  if @tag.save
      #   @status = true

      #   format.html { 
          
      #    binding.pry
      #    redirect_to root_path }
      #   format.js { binding.pry }
      #  else
      #   @status = false
      #  end
      # end
    end
  
     # PATCH/PUT /tags/1
    def update
      if @tag.update(tag_params)
        @status = true
      else
        @status = false
      end
    end
  
     # DELETE /tags/1
    def destroy
      @tag.destroy
    end
  
     private
  
     # Use callbacks to share common setup or constraints between actions.
    def set_tag
      @tag = current_user.tags.find(params[:id])
    end
  
     # Only allow a trusted parameter "white list" through.
    def tag_params
      params.require(:tag).permit(:name, :user_id)
    end
  end