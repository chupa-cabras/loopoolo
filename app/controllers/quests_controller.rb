class QuestsController < BaseController
  before_action :set_quest, only: [:finish, :cancel, :show]
  before_action :load_quests, only: [:index, :new]

  def index
    @quest = Quest.new
  end

  def new
    @quest = Quest.new
  end

  def show
  end

  def create
    @quest = Quest.new(quest_params.merge({requestor: current_user, status: :open}))
    respond_to do |format|
      if @quest.save
        format.html { redirect_to @quest, notice: 'Quest was successfully created.' }
        format.json { render :new, status: :created, location: @quest }
      else
        format.html { render :new }
        format.json { render json: @quest.errors, status: :unprocessable_entity }
      end
    end
  end

  def finish
    @quest.finished!
    respond_to do |format|
      format.html { redirect_to quests_url, notice: 'Quest was successfully finished.' }
      format.json { head :no_content }
    end
  end

  def cancel
    @quest.cancelled!
    respond_to do |format|
      format.html { redirect_to quests_url, notice: 'Quest was successfully cancelled.' }
      format.json { head :no_content }
    end
  end

  private
    def set_quest
      @quest = Quest.find(params[:id])
    end

    def quest_params
      params.require(:quest).permit(:executor_id, :description)
    end

    def load_quests
      @my_quests = Quest.where("executor_id = :id", id: current_user.id)
      @requested_quests = Quest.where("requestor_id = :id", id: current_user.id)
    end
end
