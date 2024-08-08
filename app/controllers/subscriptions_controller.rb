class SubscriptionsController < ApplicationController
  def create
    profile = Profile.find(params[:id])
    user = profile.user
    if user != current_user
      if current_user.subscribed_to.include?(user)
        flash[:notice] = "You are already subscribed to this user."
      else
        current_user.subscriptions.create(subscribed_to: user)
        flash[:notice] = "Successfully subscribed to #{profile.firstname}."
      end
      redirect_to profile
    end
  end

  def destroy
    profile = Profile.find(params[:id])
    user = profile.user
    if user != current_user
      subscription = current_user.subscriptions.find_by(subscribed_to: user)
      if subscription
        subscription.destroy
        flash[:notice] = "Successfully unsubscribed from #{profile.firstname}."
      else
        flash[:alert] = "You are not subscribed to this user."
      end
      redirect_to profile
    end
  end
end

