package ObjectClassifier::Class::Bool;
use strict;
use warnings;
use v5.14;
use parent qw(ObjectClassifier::Class);

sub accept {
    my ($self, $object) = @_;
    $object ~~ ['1', '0', '', undef];
}

1;
