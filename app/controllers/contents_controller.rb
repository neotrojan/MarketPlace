#FILE GENERATO DA SCAFFOLD PER LA GESTIONE DEI CONTENUTI
class ContentsController < ApplicationController
  #Prima di avviare show, edit... fai set_content
  before_action :set_content, only: [:show, :edit, :update, :destroy]

  # La pagina di view di riferimento è views/contents/index.html.erb
  def index
    #Prendere tutti gli elementi del db
    @contents = Content.all
  end

  # La pagina di view di riferimento è views/contents/show.html.erb
  def show
  end

  # La pagina di view di riferimento è views/contents/new.html.erb
  def new
    @content = Content.new
  end

  # GET /contents/1/edit
  def edit
  end

  # POST /contents
  # POST /contents.json
  def create
    @content = Content.new(content_params)

    respond_to do |format|
      if @content.save
        format.html { redirect_to @content, notice: 'Content was successfully created.' }
      else
        format.html { render :new }
      end
    end
  end

  # PATCH/PUT /contents/1
  # PATCH/PUT /contents/1.json
  def update
    respond_to do |format|
      if @content.update(content_params)
        format.html { redirect_to @content, notice: 'Content was successfully updated.' }
      else
        format.html { render :edit }
      end
    end
  end

  # DELETE /contents/1
  # DELETE /contents/1.json
  def destroy
    @content.destroy
    respond_to do |format|
      format.html { redirect_to contents_url, notice: 'Content was successfully destroyed.' }
    end
  end

  private
    #Precaricare id del prodotto
    def set_content
      @content = Content.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def content_params
      params.require(:content).permit(:titolo, :descrizione, :price)
    end
end
