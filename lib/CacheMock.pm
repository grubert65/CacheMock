package CacheMock;
use Dancer2;
use YAML::XS qw(Load);
use Test::LWP::UserAgent;
use Moo;

our $VERSION = '0.1';

# to be used only for testing
sub get_test_ua {
    my $ua = Test::LWP::UserAgent->new();

    # GET /login
    $ua->map_response( 
        sub{
            my $r = shift;
            return 1 if $r->method eq 'GET' && 
                        $r->uri =~ m|login/(\w+)$|;
        },
        HTTP::Response->new('200','Success', 
            ['Content-Type' => 'application/json'],
            encode_json({
                "name"    => "Will",
                "surname" => "Smith",
                "email"   => 'will.smith@example.com',
            })
        )
    );
    return $ua;
}

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
