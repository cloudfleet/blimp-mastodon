#!/bin/bash

function _create_secrets_if_necessary {
  if [ ! -f /mastodon/secrets/.env ]; then

    echo "Creating secrets ..."

    export SECRET_KEY_BASE=$(bundle exec rake secret)
    export OTP_SECRET=$(bundle exec rake secret)

    cat > /mastodon/secrets/.env <<EOF

SECRET_KEY_BASE=$SECRET_KEY_BASE
OTP_SECRET=$OTP_SECRET
EOF

    bundle exec rake mastodon:webpush:generate_vapid_key >> /mastodon/secrets/.env

  fi

}

function _load_secrets {

  echo "Loading secrets ..."

  while [ ! -f /mastodon/secrets/.env ]; do
    sleep 5
  done

  . /mastodon/secrets/.env


  export SECRET_KEY_BASE
  export OTP_SECRET
  export VAPID_PRIVATE_KEY
  export VAPID_PUBLIC_KEY

}

function web {

  _create_secrets_if_necessary

  _load_secrets

  bash -c "rm -f /mastodon/tmp/pids/server.pid; bundle exec rails s -p 3000 -b '0.0.0.0'"
}

function streaming {
  yarn start
}

function sidekiq {

  _load_secrets

  bundle exec sidekiq
}

$@
