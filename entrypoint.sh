#!/bin/bash

function web {
  SECRET_KEY_BASE=
  OTP_SECRET=
  VAPID_PRIVATE_KEY=
  VAPID_PUBLIC_KEY=
  bash -c "rm -f /mastodon/tmp/pids/server.pid; bundle exec rails s -p 3000 -b '0.0.0.0'"
}

function streaming {
  yarn start
}

function sidekiq {
  bundle exec sidekiq
}

$@
