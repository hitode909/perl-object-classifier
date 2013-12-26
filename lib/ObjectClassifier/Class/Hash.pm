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
            $self->member($key)->add($object->{$key});
        }
    }
    $accepted;
}

sub keys {
    my ($self) = @_;
    [ sort keys %{$self->members} ];
}

sub members {
    my ($self) = @_;

    $self->{members};
}

sub member {
    my ($self, $key) = @_;
    require ObjectClassifier;
    $self->members->{$key} //= ObjectClassifier->new;
}

sub rate_of_member {
    my ($self, $key) = @_;
    return 0 unless $self->length;
    $self->member($key)->length / $self->length;
}

sub class_name {
    my ($self) = @_;
    if (@{$self->keys}) {
        my $members = join ', ', map { "@{[ $_ ]}(@{[ int($self->rate_of_member($_)*100) ]}%): @{[ $self->member($_)->classify->class_name ]}" } @{$self->keys};
        "@{[ $self->SUPER::class_name ]}<@{[ $members ]}>";
    } else {
        $self->SUPER::class_name;
    }
}

1;
