package ObjectClassifier::Class::String;
use strict;
use warnings;
use v5.14;
use parent qw(ObjectClassifier::Class);

sub accept {
    my ($self, $object) = @_;
    return unless defined $object;
    ref $object eq '';
}

1;
