class ServicesController < ApplicationController

  # ONLY ADMIN


  def pregnancy_babies
    @services = Service.all
  end

  def children
    @services = Service.all
  end

  def families
    @services = Service.all
  end

  def edit
  end

  def update
  end

  def destroy
  end
end
