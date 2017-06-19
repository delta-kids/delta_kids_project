class ProgramsController < ApplicationController

  # ONLY ADMIN

    def index0_5
        @age_group = "0-5"
        @programs = Program.all
<<<<<<< HEAD
=======
    end

    def index6_12
        @age_group = "6-12"
        @programs = Program.all
>>>>>>> 1ad5ad275489c94056e87519ca8d82723a8abea5
    end

    def index6_12
        @age_group = "6-12"
        @programs = Program.all
    end

    def create
    end

    def show
    end

    def edit
    end

    def update
    end

    def destroy
    end

    def learn_more
    end


end
