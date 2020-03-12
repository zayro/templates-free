<?php
global $blogConf, $isPortfolio;
global $more;
$more = false;

if (isset($blogConf['post_contshow'])&&$blogConf['post_contshow'] != 'Full') {
    if ($blogConf['post_contshow'] != 'Hide') {
	print '<div class="entry-content">';
	print '<p>';
	if(has_excerpt()) {
		print showBrief(get_the_excerpt(), $blogConf['post_contshow']);
	} else {
		print showBrief(get_the_content('', false, ''), $blogConf['post_contshow']);
	}
	print '</p>';
	print '</div>'; }
} else if(has_excerpt()) {
    print '<div class="entry-content">';
            the_excerpt();
    print '</div>';
} else {
    print '<div class="entry-content">';
            the_content('', false, '');
    print '</div>';
}
