package ObjectClassifier::Class::Number;
use strict;
use warnings;
use v5.14;
use parent qw(ObjectClassifier::Class);
use Scalar::Util qw(looks_like_number);

sub accept {
    my ($self, $object) = @_;
    looks_like_number($object);
}

1;
