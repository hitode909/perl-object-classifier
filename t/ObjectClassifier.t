package t::ObjectClassifier;
use t::test;

sub _require : Test(startup => 1) {
    my ($self) = @_;

    use_ok 'ObjectClassifier';
}

sub _new : Tests {
    my $oc = ObjectClassifier->new;
    isa_ok $oc, 'ObjectClassifier';
}

sub add : Tests {
    my $oc = ObjectClassifier->new;
    is $oc->length, 0;
    $oc->add(1);
    is $oc->length, 1;
}
