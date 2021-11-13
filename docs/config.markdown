Config
===
Add following code in `LocalSettings.php`

```php
$wgLocaltimezone = 'Asia/Shanghai';
$wgArticlePath = "/$1";

$wgCirrusSearchServers = [ 'elasticsearch-service' ];

enableSemantics(str_replace("http://", "", $wgServer));
$smwgConfigFileDir = $IP;

$wgFlowThreadConfig['AnonymousAvatar'] = '/skins/Vector/resources/skins.vector.styles/images/user-avatar.svg';
$wgFlowThreadConfig['Avatar'] = '/skins/Vector/resources/skins.vector.styles/images/user-avatar.svg';
```
