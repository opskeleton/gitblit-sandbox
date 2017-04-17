node default {
  package{'software-properties-common':
    ensure  => present
  } -> Exec <||>

  include gitblit
  include baseline
  include baseline::update
  include baseline::mirror
  include shell
}
