class RankingsController < ApplicationController
  before_action :set_ranking, only: %i[ show edit update destroy ]

  # GET /rankings or /rankings.json
  def index
    @rankings = Ranking.all
  end

  # GET /rankings/1 or /rankings/1.json
  def show
  end

  # GET /rankings/new
  def new
    @ranking = Ranking.new
  end

  # GET /rankings/1/edit
  def edit
  end

  # POST /rankings or /rankings.json
  def create
    @ranking = Ranking.new(ranking_params)

    respond_to do |format|
      if @ranking.save
        format.html { redirect_to @ranking, notice: "Ranking was successfully created." }
        format.json { render :show, status: :created, location: @ranking }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @ranking.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /rankings/1 or /rankings/1.json
  def update
    respond_to do |format|
      if @ranking.update(ranking_params)
        format.html { redirect_to @ranking, notice: "Ranking was successfully updated." }
        format.json { render :show, status: :ok, location: @ranking }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @ranking.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /rankings/1 or /rankings/1.json
  def destroy
    @ranking.destroy
    respond_to do |format|
      format.html { redirect_to rankings_url, notice: "Ranking was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  def show_create_rankings 
    @cards = Card.all
    @ratings = Rating.all
  end

  def create_rankings 
    card_names = params.keys - %w(authenticity_token commit controller action)
    params.permit(card_names).each do|card_name, rating_id| 
      Ranking.create(
        card: Card.find_by_name(card_name),
        rating_id: rating_id,
        selection: Selection.last
      )
    end
    @rankings = Selection.last.rankings
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_ranking
      @ranking = Ranking.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def ranking_params
      params.require(:ranking).permit(:card_id, :rating_id, :selection_id)
    end
end
