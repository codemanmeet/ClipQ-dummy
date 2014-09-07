class ContentsController < ApplicationController
	respond_to :json, :html

  def index
  	@contents = Content.find_by_sql('SELECT * FROM contents ORDER BY created_at DESC')
  	respond_with @contents
  end

  def compindex
  	@contents = Content.find_by_sql('SELECT * FROM contents WHERE approved=false')
  	respond_with @contents
  end

  def show
  	@content = Content.find(params[:id])
  end

  def new 
  	@content = Content.new
  end

  def create
  	@content = Content.new(content_params)

    if @content.save
      respond_to do |format|
        format.html { redirect_to content_path }
        format.json { render json: @content, status: :created }
      end
    else
      respond_to do |format|
        format.html { render 'new' }
        format.json { render json: @content.errors, status: :unprocessable_entity }
      end
    end
  end

  def edit
  	@content = Content.find(params[:id])
  end

  def update
  	@content = Content.find(params[:id])
  	if @content.update(content_params)
  		redirect_to content_compindex_path
  	else 
  		render 'edit'
  	end
  end

  def destroy
    @content = Content.find(params[:id])
    @content.destroy
    redirect_to content_path
  end

  def upvote
    @content = Content.find(params[:id])
    @contentvote = @content.contentvotes.build
    @contentvote.upvote = 1
    @contentvote.save
    redirect_to content_path
  end

  def downvote
    @contents = Content.find(params[:id])
    @contentvote = @content.contentvotes.build
    @contentvote.downvote = 1
    @contentvote.save
    redirect_to content_path
  end

  def contentvote_params
    params.require(:contentvote).permit(:secret_id, :upvote, :downvote)
  end
  def content_params
    params.require(:content).permit(:question, :video, :picture, :tag, :open)
  end
end
