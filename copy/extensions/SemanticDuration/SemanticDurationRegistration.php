<?php

include_once( __DIR__ . '/includes/DurationValue.php' );

use SemanticDuration\DurationValue;
use SMW\DataTypeRegistry;

class SemanticDurationRegistration {
  public static function onRegistration( array $credits ) {
    if ( defined( 'SemanticDuration_VERSION' ) ) {
      return true;
    }
    define( 'SemanticDuration_VERSION', $credits['version'] );

    $GLOBALS['wgMessagesDirs']['SemanticDuration'] = __DIR__ . '/i18n';
    $GLOBALS['wgHooks']['SMW::DataType::initTypes'][] = function () {
      DataTypeRegistry::getInstance()->registerDataType(
        DurationValue::TYPE_ID,
        DurationValue::class,
        SMWDataItem::TYPE_NUMBER,
        DurationValue::TYPE_LABEL
      );
      return true;
    };
  }
}
