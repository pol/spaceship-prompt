#
# Gatekeeper (gate|gk)
#
# The Auth0 tool for managing AWS authenticated sessions
# Link: https://github.com/auth0/gatekeeper

# ------------------------------------------------------------------------------
# Configuration
# ------------------------------------------------------------------------------

SPACESHIP_GATEKEEPER_SHOW="${SPACESHIP_GATEKEEPER_SHOW=true}"
SPACESHIP_GATEKEEPER_PREFIX="${SPACESHIP_GATEKEEPER_PREFIX=""}"
SPACESHIP_GATEKEEPER_SUFFIX="${SPACESHIP_GATEKEEPER_SUFFIX="$SPACESHIP_PROMPT_DEFAULT_SUFFIX"}"
SPACESHIP_GATEKEEPER_SYMBOL="${SPACESHIP_GATEKEEPER_SYMBOL=" "}"
SPACESHIP_GATEKEEPER_COLOR="${SPACESHIP_GATEKEEPER_COLOR="208"}"

# ------------------------------------------------------------------------------
# Section
# ------------------------------------------------------------------------------

# Shows selected AWS-cli profile.
spaceship_gatekeeper() {
  [[ $SPACESHIP_GATEKEEPER_SHOW == false ]] && return

  # Check if the Gatekeeper cli is installed
  spaceship::exists /usr/local/bin/gk || return

  # Is the current profile not the default profile
  [[ -z $GK_PROFILE ]] || [[ "$GK_PROFILE" == "default" ]] && return

  # Show prompt section
  spaceship::section \
    "$SPACESHIP_GATEKEEPER_COLOR" \
    "$SPACESHIP_GATEKEEPER_PREFIX" \
    "${SPACESHIP_GATEKEEPER_SYMBOL}$GK_PROFILE" \
    "$SPACESHIP_GATEKEEPER_SUFFIX"
}
