package ObjectClassifier;
use strict;
use warnings;
use v5.14;

use ObjectClassifier::Class::Array;
use ObjectClassifier::Class::Bool;
use ObjectClassifier::Class::Hash;
use ObjectClassifier::Class::Number;
use ObjectClassifier::Class::String;
use ObjectClassifier::Class::Unknown;

sub new {
    my ($class) = @_;
    bless {
        length => 0,
        classes => [
            ObjectClassifier::Class::Hash->new,
            ObjectClassifier::Class::Array->new,
            ObjectClassifier::Class::Bool->new,
            ObjectClassifier::Class::Number->new,
            ObjectClassifier::Class::String->new,
        ],
    }, $class;
}

sub add {
    my ($self, $object) = @_;
    for my $class (@{$self->{classes}}) {
        $class->add($object);
    }
    $self->{length}++;
}

sub length {
    my ($self) = @_;
    $self->{length};
}

sub classify {
    my ($self) = @_;
    return ObjectClassifier::Class::Unknown->new unless $self->length;
    [ sort { $b->rate <=> $a->rate } @{$self->{classes}} ]->[0];
}

1;
