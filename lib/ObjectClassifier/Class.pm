package ObjectClassifier::Class;
use strict;
use warnings;
use v5.14;

sub new {
    my ($class) = @_;
    bless {
        accepted => 0,
        length => 0,
    }, $class;
}

sub accept {
    my ($self, $object) = @_;
    die;
}

sub class_name {
    my ($self) = @_;
    "@{[ (split /::/, (ref $self))[-1] ]}(@{[ int($self->rate*100) ]}%)";
}

sub add {
    my ($self, $object) = @_;
    $self->{length}++;
    my $accepted = $self->accept($object);
    $self->{accepted}++ if $accepted;
    $accepted;
}

sub rate {
    my ($self) = @_;

    return 0 unless $self->length;
    $self->{accepted} / $self->length;
}

sub length {
    my ($self) = @_;
    $self->{length};
}

1;
