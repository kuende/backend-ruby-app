FactoryGirl.define do
  factory :notification do
    profile_ref_id { SecureRandom.uuid }
    seen false
    kind { [:post_rating, :post_comment, :comment_reply].sample }
    metadata {
      {
        :message => "#{SecureRandom.hex} liked your photo",
        :from_user => SecureRandom.uuid
      }
    }
  end
end
