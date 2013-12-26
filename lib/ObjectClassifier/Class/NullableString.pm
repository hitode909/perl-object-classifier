package ObjectClassifier::Class::NullableString;
use strict;
use warnings;
use v5.14;
use parent qw(ObjectClassifier::Class);

sub accept {
    my ($self, $object) = @_;
    return ! ref $object;
}

1;
