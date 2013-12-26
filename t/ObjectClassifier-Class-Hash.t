package t::ObjectClassifier::Class::Hash;
use t::test;

sub _require : Test(startup => 1) {
    my ($self) = @_;

    use_ok 'ObjectClassifier::Class::Hash';
}

sub _new : Tests {
    my $oc = ObjectClassifier::Class::Hash->new;
    isa_ok $oc, 'ObjectClassifier::Class';
    isa_ok $oc, 'ObjectClassifier::Class::Hash';
}

sub accept : Tests {
    my $oc = ObjectClassifier::Class::Hash->new;
    ok $oc->accept({});
    ok $oc->accept({a => 'b'});
    ok ! $oc->accept('a');
}
