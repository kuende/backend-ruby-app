class API::V1::NotificationAPI < Grape::API
  include API::Concerns::BaseSettings

  namespace :notifications do
    after_validation do
      require_user!
    end

    # GET /notifications/
    get do
      notifications = Notification.where(:profile_ref_id => current_user.profile_ref_id)

      present notifications.all, :with => API::Entities::NotificationEntity
    end
  end
end
