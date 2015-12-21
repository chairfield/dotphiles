# These make up/down-arrow autocomplete take into account what I have already typed
bindkey '^[[A' up-line-or-search
bindkey '^[[B' down-line-or-search

# Think execute 'docker-compose kill' and auto-populate with 'docker-compose rm -f'
bindkey '^X^N' accept-and-infer-next-history
