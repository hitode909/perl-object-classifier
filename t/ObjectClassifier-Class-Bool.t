package t::ObjectClassifier::Class::Bool;
use t::test;

sub _require : Test(startup => 1) {
    my ($self) = @_;

    use_ok 'ObjectClassifier::Class::Bool';
}

sub _new : Tests {
    my $c = ObjectClassifier::Class::Bool->new;
    isa_ok $c, 'ObjectClassifier::Class';
    isa_ok $c, 'ObjectClassifier::Class::Bool';
}

sub accept : Tests {
    my $c = ObjectClassifier::Class::Bool->new;
    ok $c->accept(1);
    ok $c->accept(0);
    ok $c->accept('');
    ok $c->accept(undef);
    ok ! $c->accept('a');
}

sub class_name : Tests {
    my $c = ObjectClassifier::Class::Bool->new;
    is $c->class_name, 'Bool';
}
