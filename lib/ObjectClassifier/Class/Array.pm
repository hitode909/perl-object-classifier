package ObjectClassifier::Class::Array;
use strict;
use warnings;
use v5.14;
use parent qw(ObjectClassifier::Class);

sub accept {
    my ($self, $object) = @_;
    my $accepted = ref $object eq 'ARRAY';
    if ($accepted) {
        for my $value (@$object) {
            $self->member->add($value);
        }
    }
    $accepted
}

sub member {
    my ($self) = @_;
    require ObjectClassifier;
    $self->{member} //= ObjectClassifier->new;
}

1;
