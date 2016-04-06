class NotificationSeedService < BaseService
  SEED_MESSAGES = [
    "You received a new rating!",
    "Ronaldo just commented on your post",
    "You have 5 new ratings",
    "Gogu replied to your comment"
  ]

  SEED_KINDS = [
    :post_rating,
    :post_comment,
    :comment_reply
  ]

  Contract String => Any
  def initialize(profile_ref_id)
    @profile_ref_id = profile_ref_id
  end

  Contract None => Notification
  def perform
    Notification.create(
      :profile_ref_id => @profile_ref_id,
      :metadata => {
        :message => SEED_MESSAGES.sample,
        :from_user => SEED_PROFILE_REF_IDS.reject{|r| r == @profile_ref_id}.sample
      },
      :kind => SEED_KINDS.sample,
      :seen => [false, true].sample
    )
  end
end
