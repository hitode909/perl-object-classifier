package ObjectClassifier::Class::Bool;
use strict;
use warnings;
use v5.14;
use parent qw(ObjectClassifier::Class);

sub accept {
    my ($self, $object) = @_;
    return 1 unless defined $object;
    $object ~~ ['1', '0', ''];
}

1;
