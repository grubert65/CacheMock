package CacheMock;
use Dancer2;
use YAML::XS qw(Load);

our $VERSION = '0.1';

our $cache;
{
    local $/;
    my $yaml = <DATA>;
    $cache = Load( $yaml );
}

get '/login/:name' => sub {
    return $cache->{users}->{params->{name}};
};


true;


__DATA__
---
users:
  asmith:
    name:    Adam
    surname: Smith
    email:   adam.smith@example.com
  wsmith:
    name:    Will
    surname: Smith
    email:   will.smith@example.com
