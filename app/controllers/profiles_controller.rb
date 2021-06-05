class ProfilesController < ApplicationController
  before_action :authenticate_user!

  def show
    @profile = current_user.profile
  end

  def edit
    @profile = current_user.prepare_profile
  end

  def update
    @profile = current_user.prepare_profile
    @profile.assign_attributes(ptofile_params)
    @profile.save!
<<<<<<< HEAD

    render json: @profile
=======
>>>>>>> 9ea747ac1175664de822d086489dabd54f6d2be7
  end

  private
  def profile_params
    params.require(:profile).permit(:avatar)
  end
end