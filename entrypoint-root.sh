#!/bin/bash

function create_and_chown_dirs {
  mkdir -p /mastodon/secrets
  mkdir -p /mastodon/public/system

  chown -R mastodon:mastodon /mastodon
}

create_and_chown_dirs

su mastodon -c "/entrypoint.sh $@"
