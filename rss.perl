#!/usr/bin/perl
use strict;
use warnings;
use XML::RSS;
use File::Slurp;

if (@ARGV == 0) {
    die "Usage: $0 <file1> <file2> ...\n";
}

# Path to the RSS file
my $rss_file = 'public/rss.xml';

# Check if the RSS file exists
if (!-e $rss_file) {
    # Initialize a new RSS feed
    my $rss = XML::RSS->new(version => '2.0');
    $rss->channel(
        title       => "Dziban Digital Forest",
        link        => "https://dziban.net",
        description => "The learning notes of Marce Coll",
        language    => "en-us",
    );
    $rss->save($rss_file);
    print "Initialized new RSS file: $rss_file\n";
}

# Load the existing RSS file
my $rss = XML::RSS->new;
$rss->parsefile($rss_file);

# Create RSS items for each modified file
foreach my $file (@ARGV) {
    my $link = "https://dziban.net/note/$file";  # Adjust the link to point to your files
    my $description = "Modified file: $file";

    $rss->add_item(
        title       => "Modified: $file",
        link        => $link,
        description => $description,
        pubDate     => scalar localtime,  # Current time
    );
}

# Save the updated RSS file
$rss->save($rss_file);

print "RSS file updated successfully!\n";
