node default {
  package{'software-properties-common':
    ensure  => present
  } -> Exec <||>

  include gitblit
}
