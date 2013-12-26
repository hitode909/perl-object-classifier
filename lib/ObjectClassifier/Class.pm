package ObjectClassifier::Class;
use strict;
use warnings;
use v5.14;

sub new {
    my ($class) = @_;
    bless {
        accepted => 0,
        total => 0,
    }, $class;
}

sub accept {
    my ($self, $object) = @_;
    die;
}

sub add {
    my ($self, $object) = @_;
    $self->{total}++;
    if ($self->accept($object)) {
        $self->{accepted}++;
    }
}

sub rate {
    my ($self) = @_;

    return 0 unless $self->{total};
    $self->{accepted} / $self->{total};
}

1;
