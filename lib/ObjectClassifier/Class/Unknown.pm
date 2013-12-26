package ObjectClassifier::Class::Unknown;
use strict;
use warnings;
use v5.14;
use parent qw(ObjectClassifier::Class);

sub accept {
    my ($self, $object) = @_;
    0;
}

1;
