class SubscriptionsController < ApplicationController
  before_action :set_event, only: %i[create destroy]

  def create
    @new_subscription = @event.subscriptions.build(subscription_params)
    @new_subscription.user = current_user

    if @new_subscription.save
      MailerJob.perform_later(@new_subscription)
      redirect_to @event, notice: t('.created')
    else
      flash.alert = t('.error')
      render 'events/show'
    end
  end

  def destroy
    @subscription = @event.subscriptions.find(params[:id])

    message = { notice: t('.destroyed') }

    if current_user_can_edit?(@subscription)
      @subscription.destroy
    else
      message = { alert: t('.error') }
    end

    redirect_to @event, message
  end

  private

  def set_event
    @event = Event.find(params[:event_id])
  end

  def subscription_params
    params.fetch(:subscription, {}).permit(:user_email, :user_name)
  end
end
