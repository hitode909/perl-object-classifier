package ObjectClassifier::Class::Array;
use strict;
use warnings;
use v5.14;
use parent qw(ObjectClassifier::Class);

sub accept {
    my ($self, $object) = @_;
    ref $object eq 'ARRAY';
}

1;
