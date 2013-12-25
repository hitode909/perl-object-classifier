package ObjectClassifier;
use strict;
use warnings;
use v5.14;

sub new {
    my ($class) = @_;
    bless {
        objects => [],
    }, $class;
}

sub add {
    my ($self, $object) = @_;
    push $self->{objects}, $object;
}

sub length {
    my ($self) = @_;

    scalar @{$self->{objects}};
}

1;
