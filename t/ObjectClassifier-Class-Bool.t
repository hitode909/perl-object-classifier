package t::ObjectClassifier::Class::Bool;
use t::test;

sub _require : Test(startup => 1) {
    my ($self) = @_;

    use_ok 'ObjectClassifier::Class::Bool';
}

sub _new : Tests {
    my $oc = ObjectClassifier::Class::Bool->new;
    isa_ok $oc, 'ObjectClassifier::Class';
    isa_ok $oc, 'ObjectClassifier::Class::Bool';
}

sub accept : Tests {
    my $oc = ObjectClassifier::Class::Bool->new;
    ok $oc->accept(1);
    ok $oc->accept(0);
    ok $oc->accept('');
    ok $oc->accept(undef);
    ok ! $oc->accept('a');
}
