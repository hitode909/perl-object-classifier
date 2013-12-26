package ObjectClassifier::Class::Hash;
use strict;
use warnings;
use v5.14;
use parent qw(ObjectClassifier::Class);

sub new {
    my ($class) = @_;
    my $self = $class->SUPER::new;
    $self->{members} = {};
    $self;
}

sub accept {
    my ($self, $object) = @_;
    my $accepted = ref $object eq 'HASH';
    if ($accepted) {
        for my $key (keys %$object) {
            require ObjectClassifier;
            $self->{members}->{$key} //= ObjectClassifier->new;
            $self->{members}->{$key}->add($object->{$key});
        }
    }
    $accepted;
}

sub keys {
    my ($self) = @_;
    [ keys %{$self->members} ];
}

sub members {
    my ($self) = @_;

    $self->{members};
}

sub member {
    my ($self, $key) = @_;
    $self->members->{$key};
}

1;
