#!/bin/bash

function web {

  if [ ! -f /mastodon/secrets/.env ]; then

    export SECRET_KEY_BASE=$(bundle exec rake secret)
    export OTP_SECRET=$(bundle exec rake secret)

    cat > /mastodon/secrets/.env <<EOF

SECRET_KEY_BASE=$SECRET_KEY_BASE
OTP_SECRET=$OTP_SECRET
EOF

    bundle exec rake mastodon:webpush:generate_vapid_key >> cat > /mastodon/secrets/.env

  fi

  . /mastodon/secrets/.env


  export SECRET_KEY_BASE
  export OTP_SECRET
  export VAPID_PRIVATE_KEY
  export VAPID_PUBLIC_KEY
  bash -c "rm -f /mastodon/tmp/pids/server.pid; bundle exec rails s -p 3000 -b '0.0.0.0'"
}

function streaming {
  yarn start
}

function sidekiq {
  bundle exec sidekiq
}

$@
