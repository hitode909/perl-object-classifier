package t::ObjectClassifier::Class::Array;
use t::test;

sub _require : Test(startup => 1) {
    my ($self) = @_;

    use_ok 'ObjectClassifier::Class::Array';
}

sub _new : Tests {
    my $oc = ObjectClassifier::Class::Array->new;
    isa_ok $oc, 'ObjectClassifier::Class';
    isa_ok $oc, 'ObjectClassifier::Class::Array';
}

sub accept : Tests {
    my $oc = ObjectClassifier::Class::Array->new;
    ok $oc->accept([]);
    ok $oc->accept([1]);
    ok ! $oc->accept('a');
}
