php ./maintenance/update.php

# add $wgDisableSearchUpdate = true;

php ./extensions/CirrusSearch/maintenance/UpdateSearchIndexConfig.php

# remove $wgDisableSearchUpdate = true;

php ./extensions/CirrusSearch/maintenance/ForceSearchIndex.php --skipLinks --indexOnSkip
php ./extensions/CirrusSearch/maintenance/ForceSearchIndex.php --skipParse

# add $wgSearchType = 'CirrusSearch';
