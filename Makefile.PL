
use strict;
use warnings;



use ExtUtils::MakeMaker 6.30;



my %WriteMakefileArgs = (
  "ABSTRACT" => "Simple tree widget for Tickit",
  "AUTHOR" => "Tom Molesworth <cpan\@entitymodel.com>",
  "BUILD_REQUIRES" => {
    "Module::Build" => "0.3601",
    "Test::More" => "0.94"
  },
  "CONFIGURE_REQUIRES" => {
    "ExtUtils::MakeMaker" => "6.30",
    "Module::Build" => "0.3601"
  },
  "DISTNAME" => "Tickit-Widget-Tree",
  "EXE_FILES" => [],
  "LICENSE" => "perl",
  "NAME" => "Tickit::Widget::Tree",
  "PREREQ_PM" => {
    "Tickit" => "0.12",
    "parent" => 0
  },
  "VERSION" => "0.003",
  "test" => {
    "TESTS" => "t/*.t"
  }
);


unless ( eval { ExtUtils::MakeMaker->VERSION(6.56) } ) {
  my $br = delete $WriteMakefileArgs{BUILD_REQUIRES};
  my $pp = $WriteMakefileArgs{PREREQ_PM};
  for my $mod ( keys %$br ) {
    if ( exists $pp->{$mod} ) {
      $pp->{$mod} = $br->{$mod} if $br->{$mod} > $pp->{$mod};
    }
    else {
      $pp->{$mod} = $br->{$mod};
    }
  }
}

delete $WriteMakefileArgs{CONFIGURE_REQUIRES}
  unless eval { ExtUtils::MakeMaker->VERSION(6.52) };

WriteMakefile(%WriteMakefileArgs);



