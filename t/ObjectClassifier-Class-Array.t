package t::ObjectClassifier::Class::Array;
use t::test;

sub _require : Test(startup => 1) {
    my ($self) = @_;

    use_ok 'ObjectClassifier::Class::Array';
}

sub _new : Tests {
    my $c = ObjectClassifier::Class::Array->new;
    isa_ok $c, 'ObjectClassifier::Class';
    isa_ok $c, 'ObjectClassifier::Class::Array';
}

sub accept : Tests {
    my $c = ObjectClassifier::Class::Array->new;
    ok $c->accept([]);
    ok $c->accept([1]);
    ok ! $c->accept('a');
}

sub member : Tests {
    my $c = ObjectClassifier::Class::Array->new;
    ok $c->accept([1]);
    isa_ok $c->member, 'ObjectClassifier';
    isa_ok $c->member->classify, ObjectClassifier::Class::Number;
    ok $c->accept(['a', 'b']);
    isa_ok $c->member->classify, ObjectClassifier::Class::String;
}
