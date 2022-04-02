Config
===
Add following code in `LocalSettings.php`

```php
$wgArticlePath = "/$1";
$wgCapitalLinks = false;
$wgLocaltimezone = 'Asia/Shanghai';

$wgAPIModules['parse'] = 'ApiDisabled';
$wgGroupPermissions['sysop']['interwiki'] = true;
$wgGroupPermissions['*']['read'] = false;
$wgWhitelistReadRegexp = [
  '/^(?!(Private):)/'
];

define("NS_PRIVATE", 8000);
define("NS_PRIVATE_TALK", 8001);
$wgExtraNamespaces[NS_PRIVATE] = "Private";
$wgExtraNamespaces[NS_PRIVATE_TALK] = "Private_Talk";
$smwgNamespacesWithSemanticLinks[NS_PRIVATE] = true;

$wgContentNamespaces = [
  NS_MAIN,
  NS_PRIVATE
];

$wgCirrusSearchServers = [ 'elasticsearch-service' ];
$wgSearchType = 'CirrusSearch';

enableSemantics(str_replace("http://", "", $wgServer));
$smwgConfigFileDir = $IP;

$wgFlowThreadConfig['AnonymousAvatar'] = '/skins/Vector/resources/skins.vector.styles/images/user-avatar.svg';
$wgFlowThreadConfig['Avatar'] = '/skins/Vector/resources/skins.vector.styles/images/user-avatar.svg';
```
