package t::ObjectClassifier::Class::String;
use t::test;

sub _require : Test(startup => 1) {
    my ($self) = @_;

    use_ok 'ObjectClassifier::Class::String';
}

sub _new : Tests {
    my $oc = ObjectClassifier::Class::String->new;
    isa_ok $oc, 'ObjectClassifier::Class';
    isa_ok $oc, 'ObjectClassifier::Class::String';
}

sub accept : Tests {
    my $oc = ObjectClassifier::Class::String->new;
    ok $oc->accept('a');
    ok $oc->accept('');
    ok $oc->accept(1);
    ok ! $oc->accept(undef);
    ok ! $oc->accept({});
}
