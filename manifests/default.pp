node default {
  include apt

  package{'software-properties-common':
    ensure  => present
  } -> Exec <||>

  include gitblit
  include baseline
  include baseline::update
  include shell
}
