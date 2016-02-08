---
layout: post
title: "perl proc text"
date: "2015-01-03"
---

# Perl and text

This is, of course, where Perl really shines. I'm including some information on
command line options, see `perldoc perlrun` for more details, and a handful of
other packages to read/write common representations of data.

## command line

### split lines automatically on white-space

Splitting text on the command line with `-a` creates `@F` automatically, which
has all of the processed text. It must be used with either the `-n` or `-p`
options, which both place a loop around your script. The difference being that
`-p` executes your commands and *prints* the value of `$_` afterward.

    perl -nalE '{ print $F[3]; }' some_file

### specify how to split each line with `-F`

Specifying `-F` implicitly sets `-a` and `-n`. To split using the semicolon try:

    perl -F';' -lE '{ print $F[2]; }' some_file

## read csv

    use Text::CSV_XS;
    use Text::Iconv;
    my $csv_reader = Text::CSV_XS->new({auto_diag => 1, binary => 1});

## write csv

    use Text::CSV_XS;
    use Text::Iconv;
    my $csv_writer = Text::CSV_XS->new({
      binary => 1, auto_diag => 1, always_quote => 1, eol => "\n"
    });

## read xls

    use Spreadsheet::ParseExcel;
    my $parser   = Spreadsheet::ParseExcel->new();
    my $workbook = $parser->parse($file);


## read xlsx

    use Spreadsheet::XLSX;
    use Text::Iconv;
    my $converter = Text::Iconv->new("utf-8", "windows-1251");
    my $in_excel = Spreadsheet::XLSX->new($file, $converter);


## write xlsx

    use Excel::Writer::XLSX;
    my $workbook = Excel::Writer::XLSX->new("$out_ext.xlsx");
    $workbook->set_properties(
      title    => "data created by $prog_name on $now_time",
      author   => 'TS Wingo',
      comments => 'created with perl and Excel::Writer::XLSX'
    );

# Perl and seralizing data

## JSON - for machines

    use Cpanel::JSON::XS;
    my $json = new Cpanel::JSON::XS;
    print $json->pretty(1)->encode(\%data);

## YAML - for humans

    use YAML qw(Dump Bless);
    print Dump(\%data);

# Perl and dates/times

## read dates and make a DateTime object

    use DateTime;
    use DateTime::Format::Strptime;

    # some common ones I've (unfortuneately) encountered

    # YYYY-MM-DD
    my $strp_dt_iso    = DateTime::Format::Strptime->new(
      pattern => '%F', on_error => 'croak'
    );

    # MM/DD/YYYY HH:MM:SS AM/PM (12h time)  
    my $strp_dt_us_12h = DateTime::Format::Strptime->new(
      pattern => '%m/%d/%Y %I:%M:%S %p', on_error => 'croak'
    );

    # MM/DD/YYYY
    my $strp_dt_us     = DateTime::Format::Strptime->new(
      pattern => '%m/%d/%Y', on_error => 'croak'
    );

    # DD-Mos-YY (month = 3 letter abbreviation)
    my $strp_dt_crazy  = DateTime::Format::Strptime->new(
      pattern => '%d-%B-%y', on_error => 'croak'
    );

    # parse
    $dt = $strp_dt_us->parse_datetime($this_data{date});

## get current time?

    use Time::localtime;
    # time
    my $now_time       = ctime();
    # date
    my $now_timestamp  = sprintf("%d-%d-%d", eval(localtime->year() + 1900),
      eval(localtime->mon() + 1), localtime->mday());


## file modified time

    use Time::localtime;
    use File::stat;
    $date_string = ctime(stat($file)->mtime);
