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
    ok $c->add([1]);
    isa_ok $c->member, 'ObjectClassifier';
    isa_ok $c->member->classify, ObjectClassifier::Class::Number;
    ok $c->add(['a', 'b']);
    isa_ok $c->member->classify, ObjectClassifier::Class::String;
}

sub class_name : Tests {
    my $c1 = ObjectClassifier::Class::Array->new;
    $c1->add([]);
    is $c1->class_name, 'Array(100%)';

    my $c2 = ObjectClassifier::Class::Array->new;
    $c2->add([[1]]);
    is $c2->class_name, 'Array(100%)<Array(100%)<Number(100%)>>';
}
