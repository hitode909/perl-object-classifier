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
