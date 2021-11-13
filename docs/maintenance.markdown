Maintenance
===

Update MediaWiki changes
---
```shell
php ./maintenance/update.php
```

Run Job
---
```shell
php ./maintenance/runJobs.php
```

Initialize CirrusSearch
---
* add `$wgDisableSearchUpdate = true;` in `LocalSetttings.php`
* execute `php ./extensions/CirrusSearch/maintenance/UpdateSearchIndexConfig.php`
* remove `$wgDisableSearchUpdate = true;`
* execute `php ./extensions/CirrusSearch/maintenance/ForceSearchIndex.php --skipLinks --indexOnSkip && php ./extensions/CirrusSearch/maintenance/ForceSearchIndex.php --skipParse`
* add `$wgSearchType = 'CirrusSearch';` in `LocalSetttings.php`
