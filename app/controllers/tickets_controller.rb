class TicketsController < ApplicationController
  before_action :set_ticket, only: %i[ show edit update destroy tickets_tasks]
  include TicketsHelper
  include CommentsHelper

  # GET /tickets or /tickets.json
  def index
    @filtrt_options = params[:short_by]
    @ticket_id = params[:ticket_id]
    @user = User.find_by_id(session[:user_id])
    @department =  helpers.setUpCookie(params[:department])
    @tickets = helpers.dynamic_index(@user,params[:short_by], params[:ticket_id], @department)
  end

  # GET /tickets/1 or /tickets/1.json
  def show
    @user = User.find_by_id(session[:user_id])
    if @user.group != "User" && @ticket.readed == false
      Ticket.mark_ticket_as_readed(@ticket)
    end
  end

  def watch
    Ticket.watch_a_ticket(params[:id],User.find_by_id(session[:user_id]))
    redirect_to Ticket.find_by_id(params[:id])
  end


  def unwatch
   ticket_updated = Ticket.unwatch_a_ticket(params[:id],User.find_by_id(session[:user_id]))
   if !ticket_updated
    redirect_to Ticket.find_by_id(params[:id]), :notice => "You can not stop watching your own ticket!"
   else
    redirect_to Ticket.find_by_id(params[:id])
   end
  end


  def reply
    Ticket.post_comment(ticket_params[:comment],Ticket.find(ticket_params[:id]))
  end

  def tickets_tasks
    
  end

  # GET /tickets/new
  def new
    @ticket = Ticket.new
  end

  # GET /tickets/1/edit
  def edit
  end

  def imWorkingOnIt
    Ticket.declare_employee_to_ticket(Ticket.find_by_id(params[:ticket_id]), User.find_by_id(session[:user_id]))
    redirect_to Ticket.find_by_id(params[:ticket_id])
  end

  def solved
    Ticket.mark_ticket_as_solved(Ticket.find(params[:ticket_id]))
    redirect_back(fallback_location: tickets_path)
  end



  # POST /tickets or /tickets.json
  def create
    @ticket = Ticket.new(ticket_params)

    respond_to do |format|
      if @ticket.save
        format.html { redirect_to @ticket, notice: "Ticket was successfully created." }
        format.json { render :show, status: :created, location: @ticket }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @ticket.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /tickets/1 or /tickets/1.json
  def update
    if params[:commit] == "Reassing"
      if  Ticket.reasing_ticket(ticket_params[:ticketDepartment],Ticket.find_by_id(params[:id]),User.find(session[:user_id]))
        redirect_to Ticket.find_by_id(params[:id])
      else
        redirect_to Ticket.find_by_id(params[:id]), :notice => "Something went wrong!"
      end
    elsif params[:commit] == "Close Ticket" || params[:commit] == "Reopen Ticket"
      Ticket.change_status(Ticket.find_by_id(params[:id]), params[:commit],ticket_params[:reason],User.find_by_id(session[:user_id]).username)
      redirect_to Ticket.find_by_id(params[:id])
    else
     respond_to do |format|

        if @ticket.update(ticket_params)
          format.html { redirect_to @ticket, notice: "Ticket was successfully updated." }
          format.json { render :show, status: :ok, location: @ticket }
        else
          format.html { render :edit, status: :unprocessable_entity }
          format.json { render json: @ticket.errors, status: :unprocessable_entity }
        end
    end
  end
  end

  # DELETE /tickets/1 or /tickets/1.json
  def destroy
    @ticket.destroy
    respond_to do |format|
      format.html { redirect_to tickets_url, notice: "Ticket was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private

    # Use callbacks to share common setup or constraints between actions.
    def set_ticket
      @ticket = Ticket.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def ticket_params
      params.require(:ticket).permit(:user, :watchers, :reason,  :title, :assing, :status,  {:images =>[]}, :content, :comment, :id, :ticketDepartment)
    end


end
