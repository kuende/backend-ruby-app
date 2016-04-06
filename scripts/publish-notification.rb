#!/usr/bin/env ruby

require_relative '../config/boot'

Hutch.connect

Hutch.publish('bs.notification.new', {
  "profile_ref_id" => SEED_PROFILE_REF_IDS.sample,
  "message" => "You received a new rating!",
  "kind" => "post_rating",
  "data" => {
    "from_user" => SEED_PROFILE_REF_IDS.sample,
  }
})
