package t::ObjectClassifier::Class::Unknown;
use t::test;

sub _require : Test(startup => 1) {
    my ($self) = @_;

    use_ok 'ObjectClassifier::Class::Unknown';
}

sub _new : Tests {
    my $oc = ObjectClassifier::Class::Unknown->new;
    isa_ok $oc, 'ObjectClassifier::Class';
    isa_ok $oc, 'ObjectClassifier::Class::Unknown';
}

sub accept : Tests {
    my $oc = ObjectClassifier::Class::Unknown->new;
    ok ! $oc->accept('a');
    ok ! $oc->accept(undef);
}

sub class_name : Tests {
    my $c = ObjectClassifier::Class::Unknown->new;
    is $c->class_name, 'Unknown';
}
