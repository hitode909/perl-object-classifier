package ObjectClassifier::Class::Number;
use strict;
use warnings;
use v5.14;
use parent qw(ObjectClassifier::Class);

sub accept {
    my ($self, $object) = @_;
    return unless defined $object;
    $object =~ /\d/;
}

1;
