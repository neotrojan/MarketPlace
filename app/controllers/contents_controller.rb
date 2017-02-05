#FILE GENERATO DA SCAFFOLD PER LA GESTIONE DEI CONTENUTI
class ContentsController < ApplicationController
  #Prima di avviare show, edit... fai set_content
  before_action :set_content, only: [:show, :edit, :update, :destroy]

  #Per devise -  prima di fare tutto, controlla se l'utente è autenticato o meno
  #Ma non serve per index e show
  before_action :authenticate_user!, except: [:index, :show]

  #Per devise -  prima di fare tutto, controlla se l'utente è il creatore del prodotto
  #Non far modificare prodotti di altri utenti
  before_action :check_user, only: [:edit, :update, :destroy]

  # La pagina di view di riferimento è views/contents/index.html.erb
  def index
    #Prendere tutti gli elementi del db e visulizzabili in ordine dal più vecchio, 
    #mentre aggiungendo .order("created_at DESC") di ordina al contrario
    #Aggiungendo .paginate(:page => params[:page], :per_page => 30) si avrà ogni pagina di al massimo 12 contenuti
    @contents = Content.all.order("created_at DESC").paginate(:page => params[:page], :per_page => 12)
  end

  # La pagina di view di riferimento è views/contents/show.html.erb
  def show
  end

  # La pagina di view di riferimento è views/contents/new.html.erb
  def new
    #Associare al contenuto l'utente loggato
    @content = current_user.contents.build
  end


  def edit
  end


  def create
    #Associare al contenuto l'utente loggato
    @content = current_user.contents.build(content_params)

    respond_to do |format|
      if @content.save
        format.html { redirect_to @content, notice: 'Il contenuto è stato creato con successo' }
      else
        format.html { render :new }
      end
    end
  end


  def update
    respond_to do |format|
      if @content.update(content_params)
        format.html { redirect_to @content, notice: 'Il contenuto è stato aggiornato con successo' }
      else
        format.html { render :edit }
      end
    end
  end


  def destroy
    @content.destroy
    respond_to do |format|
      format.html { redirect_to contents_url, notice: 'Il contenuto è stato eliminato' }
    end
  end

  private
    #Precaricare id del prodotto, aggiungendo friendly, verrà riercato per titolo
    def set_content
      @content = Content.friendly.find(params[:id])
    end

    #Parametri accettati, aggiungiamo cover e allegato
    def content_params
      params.require(:content).permit(:titolo, :descrizione, :price, :cover, :allegato)
    end

    #Serve per le autorizzazioni a moficare o cancellare un contenuto
    #Se l'utente è diverso dall'utente loggato, rimandalo all'home e fai compareire un errore
    def check_user
      if current_user != @content.user
        redirect_to root_url, alert:"Scusa ma non hai accesso a quesa pagina" 
      end
    end
end
