cat <<EOT >> LocalSettings.php
$wgArticlePath = "/$1";

enableSemantics(str_replace("http://", "", $wgServer));
$smwgConfigFileDir = $IP;

$wgFlowThreadConfig['AnonymousAvatar'] = '/skins/Vector/resources/skins.vector.styles/images/user-avatar.svg';
$wgFlowThreadConfig['Avatar'] = '/skins/Vector/resources/skins.vector.styles/images/user-avatar.svg';
EOT
