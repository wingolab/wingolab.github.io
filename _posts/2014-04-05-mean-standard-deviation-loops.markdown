---
layout: post
title: mean, standard deviation loops
date: 2014-04-05 15:08:06.000000000 -04:00
---
## calculate mean and std
You want to find the maximium likelihood standard deviation and mean.

It might look like this:

		my ($mean, $ssq, $count) = (0, 0, 0);
		foreach my $i (keys %sample_coverage)
		{
		  my $depth = $sample_coverage{$i} / $tot_bases;
		  $mean += $depth;
		  $ssq  += $depth * $depth;
		  $count++;
		}
		$mean /= $count;
		my $std = sqrt( ( ($ssq / $count) - $mean * $mean) );
