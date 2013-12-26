package t::ObjectClassifier::Class::Number;
use t::test;

sub _require : Test(startup => 1) {
    my ($self) = @_;

    use_ok 'ObjectClassifier::Class::Number';
}

sub _new : Tests {
    my $oc = ObjectClassifier::Class::Number->new;
    isa_ok $oc, 'ObjectClassifier::Class';
    isa_ok $oc, 'ObjectClassifier::Class::Number';
}

sub accept : Tests {
    my $oc = ObjectClassifier::Class::Number->new;
    ok $oc->accept(3);
    ok $oc->accept(0);
    ok $oc->accept(0.2);
    ok ! $oc->accept('a');
    ok ! $oc->accept(undef);
    ok ! $oc->accept({});
    ok ! $oc->accept([]);
}

sub rate : Tests {
    my $oc = ObjectClassifier::Class::Number->new;
    is $oc->rate, 0;
    $oc->add(3);
    is $oc->rate, 1;
    $oc->add('a');
    is $oc->rate, 0.5;
}
