class ContentController < ApplicationController
  before_filter :authenticate_user!

  def weekly
    authorize! :view, :weekly, :message => 'Access limited to Weekly Plan subscribers.'
  end

  def fortnightly
    authorize! :view, :fortnightly, :message => 'Access limited to Fortnightly Plan subscribers.'
  end

  def monthly
    authorize! :view, :monthly, :message => 'Access limited to Monthly Plan subscribers.'
  end
end