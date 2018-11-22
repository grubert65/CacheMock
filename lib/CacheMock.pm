package CacheMock;
use Dancer2;
# use Dancer2::Plugin::REST;
use YAML::XS qw(Load);

our $VERSION = '0.1';

# prepare_serializer_for_format;

our $cache;

{
    local $/;
    my $yaml = <DATA>;
    $cache = Load( $yaml );
}

get '/' => sub {
    template 'index' => { 'title' => 'CacheMock' };
};

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
