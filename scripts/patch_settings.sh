cat <<EOT >> LocalSettings.php
$wgArticlePath = "/$1";
enableSemantics(str_replace("http://", "", $wgServer));
$smwgConfigFileDir = $IP;
EOT
