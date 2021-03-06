class ContentsController < ApplicationController
	respond_to :json, :html

  # put your own credentials here
  account_sid = 'AC5be3d63327768fda22ea58caa5012314'
  auth_token = '751b01371f54e97969a1ca5a0e8982dc'

# set up a client to talk to the Twilio REST API
  @client = Twilio::REST::Client.new account_sid, auth_token
  HELLO = @client
  puts "#{@client}"

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
      begin
      HELLO.messages.create(
         :from => '+1650*******',
         :to => '+1408*******',
         :body => 'Hey there! Your ClipQ has been uploaded! Rejoice!'
      )
    rescue
    end
      respond_to do |format|
        format.html { redirect_to contents_path }
        format.json { render json: @content, status: :created }
      end
    else
      respond_to do |format|
        format.html { render 'new' }
        format.json { render json: @content.errors, status: :unprocessable_entity }
      end
    end
 
      

  end

  # def create2
 
   
  #   respond_to do |format|
  #     format.html {render text: "Your data was sucessfully loaded. Thanks"}
  #     format.json { 
  #                  Content.create(question: params[:question], video: params[:video], updated_at: Time.now)
  #                  render text: Content.last.to_json  # !
  #                 }
  #   end
  # end

  def edit
  	@content = Content.find(params[:id])
  end

  def update
  	@content = Content.find(params[:id])
  	if @content.update(content_params)
  		redirect_to contents_compindex_path
  	else 
  		render 'edit'
  	end
  end

  def destroy
    @content = Content.find(params[:id])
    @content.destroy
    redirect_to contents_path
  end

  def upvote
    @content = Content.find(params[:id])
    @contentvote = @content.contentvotes.build
    @contentvote.upvote = 1
    @contentvote.save
    redirect_to contents_path
  end

  def downvote
    @contents = Content.find(params[:id])
    @contentvote = @content.contentvotes.build
    @contentvote.downvote = 1
    @contentvote.save
    redirect_to contents_path
  end

   def text_updates(content)
    @content= content
    # @account_sid = ENV["TWILIO_ID"]
    # @auth_token = ENV["TWILIO_SECRET"]
        # set up a client to talk to the Twilio REST API 
        @client = Twilio::REST::Client.new ENV["TWILIO_ID"], ENV["TWILIO_SECRET"]  
        @client.account.messages.create({
          :from => ENV["TWILIO_PHONE"], 
          :to => "#{@content.number}",
          :body => "#{@content.name}: #{@content.message}"
          })
    end

    def text_confirm(content)
      get '/sms-quickstart' do
      reply = params[:Body]
      if reply == 'yes'
          @twiml = Twilio::TwiML::Response.new do |r|
          r.Message "Great. We'll send the message."
      end
          @twiml.text
      end
      end

    end

  def contentvote_params
    params.require(:contentvote).permit(:secret_id, :upvote, :downvote)
  end
  def content_params
    params.require(:content).permit(:video, :username, :categ)
  end
end
