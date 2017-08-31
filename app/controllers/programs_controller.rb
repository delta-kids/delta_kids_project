class ProgramsController < ApplicationController

  # ONLY ADMIN
    def index
      @programs = Program.all
    end

    def index0_5
        @age_group = "0-5"
        @programs = Program.all
    end

    def index6_12
        @age_group = "6-12"
        @programs = Program.all
    end

    def index6_12
        @age_group = "6-12"
        @programs = Program.all
    end

    def create
      @program = Program.new program_params
      if @program.save
        flash[:notice] = 'Organization create'
        redirect_to program_path(@program)
      else
        flash.now[:alert] = @program.pretty_errors
        render :new
      end
    end

    def show
        @program = Program.find(params[:id])
    end

    def edit
        @program = Program.find(params[:id])
    end

    def update
      @program.update(program_params)
      redirect_to @program, notice: "Successfully Updated"
    end

    def destroy
      if is_admin?
        @program.destroy
        redirect_to programs_path, notice: "Program Deleted!"
      else
        flash[:alert] = "Access Denied"
        redirect_to @program
      end

    def learn_more
    end
  end
    private
    def program_params
      params.require(:program).permit([:description, :registration, :cost, { program_type_ids: [] }, { organization_id: [] }])
    end
    def find_program
      @program = Program.find params[:id]
    end

  end
