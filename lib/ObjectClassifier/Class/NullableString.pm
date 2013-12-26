package ObjectClassifier::Class::NullableString;
use strict;
use warnings;
use v5.14;
use parent qw(ObjectClassifier::Class::String);

sub accept {
    my ($self, $object) = @_;
    return 1 unless defined $object;
    $self->SUPER::accept($object);
}

1;
